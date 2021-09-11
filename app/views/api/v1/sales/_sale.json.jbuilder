json.extract! sale, :id, :product, :quantity, :amount
json.created_at sale.created_at.strftime("%e %B, %Y")
