json.products @products, partial: "api/v1/products/product", as: :product
json.out_of_stock @out_of_stock, partial: "api/v1/products/product", as: :product
json.today_sales_count @today_sales_count
json.this_week_sales_count @this_week_sales_count
