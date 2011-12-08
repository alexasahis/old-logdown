class AttachedImage < ActiveRecord::Base
  attr_accessor :tmp_upload_dir

  validates_presence_of :image_file_name

  belongs_to :user

  has_attached_file :image,
    :path => ":rails_root/public/system/:class/:year/:month/:id/:style/:filename",
    :url => "/system/:class/:year/:month/:id/:style/:filename",
    :styles => {
      :thumb => "100x100>",
      :show => "1000x1000>"
    }
  validates_attachment_content_type :image,
    :content_type => [ "image/gif", "image/jpeg", "image/png", "image/pjpeg", "image/x-png" ],
    :message => "格式必須是 (jpeg、png、gif) 圖片類型的檔案"
  validates_attachment_size :image,
    :less_than => 3.megabytes,
    :message => "大小不可超過 3MB"

  before_save :randomize_image_file_name
  after_create :clean_tmp_upload_dir

  def self.latest(period = 5.seconds.ago)
    where("created_at > ?", period)
  end
  
  # cancel post-processing now, and set flag...
  before_image_post_process do |image|
    if image.source_changed?
      image.processing = true
      #false # halts processing
      true # run first processing for resize
    end
  end

  # ...and perform after save in background
  after_save do |image|
    if image.source_changed? && !image.processing?
      Delayed::Job.enqueue ImageJob.new(image.id)
    end
  end

  # generate styles (downloads original first)
  def regenerate_styles!
    self.image.reprocess!
    self.processing = false
    self.save(false)
  end

  def print_watermark!
    path = self.image.path
    user_id = self.user.id
    image = MiniMagick::Image.open(path)
    image.combine_options do |options|
      options.gravity "Southeast"
      options.pointsize count_watermark_size(image[:width].to_i, image[:height].to_i)
      options.stroke "#FFFFFF"
      options.draw "text 10,10 ##{user_id}"
      options.fill "#FFFFFF"
    end
    image.write(path)
  end

  # detect if our source file has changed
  def source_changed?
    self.image_file_size_changed? || self.image_file_name_changed? || self.image_content_type_changed? || self.image_updated_at_changed?
  end

  # handle new param
  def fast_image_upload=(file)
    if file && file.respond_to?('[]')
      self.tmp_upload_dir = "#{file['filepath']}_1"
      tmp_file_path = "#{self.tmp_upload_dir}/#{file['original_name']}"
      FileUtils.mkdir_p(self.tmp_upload_dir)
      FileUtils.mv(file['filepath'], tmp_file_path)
      self.image = File.new(tmp_file_path)
      self.processing = file['processing']
    end
  end

  protected

  # clean tmp directory used in handling new param
  def clean_tmp_upload_dir
    FileUtils.rm_r(tmp_upload_dir) if self.tmp_upload_dir && File.directory?(self.tmp_upload_dir)
  end

  def randomize_image_file_name
    return if image_file_name.blank?
    extension = File.extname(image_file_name).downcase
    if image_file_name_changed?
      self.image.instance_write(:file_name, "#{ActiveSupport::SecureRandom.hex(16)}#{extension}")
    end
  end

  def count_watermark_size(width, height)
    max_width, max_height, ratio = 600, 600, 0.03

    if width >= max_width && height >= max_height
      if width/height >= max_width/max_height
        max_width * ratio * (width.to_f/max_width)
      else
        max_width * ratio * (height.to_f/max_height)
      end
    elsif width >= max_width && height < max_height
      max_width * ratio * (width.to_f/max_width)
    elsif width < max_width && height >= max_height
      max_width * ratio * (height.to_f/max_height)
    elsif width < max_width && height < max_height
      max_width * ratio
    else
      max_width * ratio
    end
  end

end


# == Schema Information
#
# Table name: attached_images
#
#  id                 :integer(4)      not null, primary key
#  user_id            :integer(4)
#  processing         :boolean(1)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer(4)
#  image_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#

