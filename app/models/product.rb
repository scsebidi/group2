class Product < ActiveRecord::Base
	has_many :product_image
	has_many :reviews
	has_many :line_items
	is_impressionable
	has_attached_file :photo, 
                    :styles => {
                      :thumb => "75x75>",
                      :small => "150x150>"
                    } 
def self.search(query)
  where("name like ?", "%#{query}%") 
end
end
