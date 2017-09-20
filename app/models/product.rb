class Product < ApplicationRecord
     CATEGORY = %w[Mobile Laptop Tablet].freeze

has_many :reviews
has_many :questions
validates_uniqueness_of :name
validates_presence_of :name ,:price, :category

mount_uploader :image ,ImageUploader
def self.search(params)
	products= Product.where("name LIKE ? or description LIKE?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    products	
  end
end