# app/models/sale.rb
class Sale < ApplicationRecord


  def self.currently_active
    where("start_on <= ? AND end_on >= ?", Date.today, Date.today).first
  end

end
