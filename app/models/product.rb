class Product < ActiveRecord::Base
    validates :title, presence: true
    validates :description, length: { maximum: 500 }, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}, presence: true

    def self.latest
        Product.order(:updated_at).last
    end
end
