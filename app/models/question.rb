class Question < ApplicationRecord
	belongs_to :user
	has_many :answers
	belongs_to :product
validates_presence_of :content
end