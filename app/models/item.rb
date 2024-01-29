class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to :prefecture
  belongs_to :category
  belongs_to :item_status
  belongs_to :shopping_cost
  belongs_to :shopping_date

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
    validates :category_id
    validates :item_status_id
    validates :shopping_cost_id
    validates :shopping_date_id
  end

  with_options presence: true do
    validates :title
    validates :description
    validates :prefecture_id
    validates :category_id
    validates :item_status_id
    validates :shopping_cost_id
    validates :shopping_date_id
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end
end
