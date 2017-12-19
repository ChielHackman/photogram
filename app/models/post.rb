class Post < ApplicationRecord
  has_attached_file :image, styles: { :medium => "640px" }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end