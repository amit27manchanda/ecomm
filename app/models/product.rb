class Product < ApplicationRecord
     CATEGORY = %w[mobile laptop tablet].freeze

has_many :reviews
validates_uniqueness_of :name
validates_presence_of :name ,:price, :category

mount_uploader :image ,ImageUploader
end