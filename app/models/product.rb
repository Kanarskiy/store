class Product < ActiveRecord::Base
    validates :title, presence: true
    validates :description, length: { maximum: 500 }, presence: true
    validates :price, numericality: {greater_than: 0}, presence: true
end
