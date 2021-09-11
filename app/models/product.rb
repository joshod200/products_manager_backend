class Product < ApplicationRecord
  has_many :sales

  attr_accessor :y, :x, :height, :width

  mount_uploader :image, ImageUploader

  scope :out_of_stock, -> { where("quantity < ?", 5) }
end
