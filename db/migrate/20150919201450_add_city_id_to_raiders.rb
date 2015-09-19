class AddCityIdToRaiders < ActiveRecord::Migration
  def change
    add_column :raiders, :city_id, :integer
  end
end
