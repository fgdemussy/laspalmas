class City < ActiveRecord::Base

  def self.order_for_select
    a = City.order(:name)
    b = []
    b << City.find_by_name("Other")
    a = a - b + b
    return a
  end

end
