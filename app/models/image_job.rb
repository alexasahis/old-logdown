class ImageJob < Struct.new(:attached_image_id)
  def perform
    AttachedImage.find(self.attached_image_id).print_watermark!
    AttachedImage.find(self.attached_image_id).regenerate_styles!
  end
end