class Sale < ApplicationRecord
  belongs_to :product
  scope :today_sales, -> { where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day) }
  scope :this_week_sales, -> { where(created_at: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week) }
  scope :today_sales_count, -> { today_sales.count }
  scope :this_week_sales_count, -> { this_week_sales.count }
end
