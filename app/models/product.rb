class Product < ActiveRecord::Base
    has_many :line_items
    belongs_to :customer

    before_destroy :ensure_not_referenced_by_any_line_item

    validates :title, presence: true
    validates :description, length: {maximum: 500}, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}, presence: true


    def self.latest
        Product.order(:updated_at).last
    end

    private
    # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар
    def ensure_not_referenced_by_any_line_item
        if line_items.empty?
            return true
        else
            errors.add(:base, 'There are line items in some cart')
            return false
        end
    end
end
