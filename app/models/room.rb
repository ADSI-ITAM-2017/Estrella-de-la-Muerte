class Room < ApplicationRecord
  belongs_to :usuario
  belongs_to :category
  has_many :reviews

  has_attached_file :room_img, styles: { room_index: "250x350>", room_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :room_img, content_type: /\Aimage\/.*\z/
end
