class ProductImage < ActiveRecord::Base
	belongs_to :product 
	has_attached_file :picture,
                    :styles => {
                      :thumb => "75x75>",
                      :small => "150x150>"
                    }
	validates_attachment_content_type :picture, :content_type => %w(image/jpeg image/jpg)
end
