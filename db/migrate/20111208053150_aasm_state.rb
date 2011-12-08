class AasmState < ActiveRecord::Migration
  def self.up
    add_column :posts, :aasm_state, :string
    add_column :posts, :published_at , :datetime
  end

  def self.down
    remove_column :posts, :aasm_state
    remove_column :posts, :published_at
  end
end
