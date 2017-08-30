class Product < ApplicationRecord
     CATEGORY = %w[mobile laptop tablet].freeze



validates_presence_of :name ,:price, :category
end