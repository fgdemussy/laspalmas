class AddBirthdateToRaider < ActiveRecord::Migration
  def change
    add_column :raiders, :birthdate, :date
  end
end
