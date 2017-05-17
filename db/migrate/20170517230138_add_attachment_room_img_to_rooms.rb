class AddAttachmentRoomImgToRooms < ActiveRecord::Migration[5.1]
  def self.up
    change_table :rooms do |t|
      t.attachment :room_img
    end
  end

  def self.down
    remove_attachment :rooms, :room_img
  end
end
