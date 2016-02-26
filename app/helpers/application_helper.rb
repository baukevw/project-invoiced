module ApplicationHelper

  def generated_invoice_number
    latest_invoice = Invoice.where(user_id: current_user).last
    if latest_invoice
      new_number = latest_invoice.number + 1
    else
      100000
    end
  end

  def price_incl_fat(price, amount, fat)
    sum = (fat.to_f + 100) / 100
    total_price_ex = price * amount
    number_to_currency(total_price_ex * sum, unit: "€ ", separator: ",")
  end

  def fat(invoice)
    number_to_currency(invoice.activities.sum(:price_ex_fat))
  end

  def total(invoice)
    number_to_currency(invoice.activities.sum(:price_ex_fat))
  end
end
