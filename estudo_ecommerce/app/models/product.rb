class Product < ApplicationRecord
    has_attached_file :image, styles: {large: "600x600>", normal: "700x400>", medium: "300x300>", thumb: "150x150#"}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    belongs_to :user
end