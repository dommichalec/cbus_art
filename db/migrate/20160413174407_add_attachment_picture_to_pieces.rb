class AddAttachmentPictureToPieces < ActiveRecord::Migration
  def self.up
    change_table :pieces do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :pieces, :picture
  end
end
