# app/helpers/application_helper.rb
module ApplicationHelper
  def custom_number_to_currency(amount)
    number_to_currency(amount, precision: 2, delimiter: ".", separator: ",")
  end
end

