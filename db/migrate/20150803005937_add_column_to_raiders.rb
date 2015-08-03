class AddColumnToRaiders < ActiveRecord::Migration
  def change
    add_column :raiders, :email, :string
  end
end
