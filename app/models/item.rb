class Item < ActiveRecord::Base
  belongs_to :category
  # accepts_nested_attributes_for :line_items
  has_many :line_items

  def self.available_items
    where("inventory > 0")
  end
end
