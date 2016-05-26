module ApplicationHelper

  def generated_invoice_number
    latest_invoice = Invoice.where(user_id: current_user).last
    if latest_invoice
      new_number = latest_invoice.number + 1
    else
      100000
    end
  end

  def total_item_price_excl_vat(price, amount)
    price * amount
  end

  def total_price_excl_vat(invoice)
    q = 0
    invoice.activities.each do |i|
      q += i.price_ex_fat * i.amount
    end
    q
  end

  def vat(invoice)
    total_price_excl_vat(invoice) * 0.21
  end

  def total_price_incl_vat(invoice)
    total_price_excl_vat(invoice) * 1.21
  end
end
