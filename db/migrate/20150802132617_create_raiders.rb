class CreateRaiders < ActiveRecord::Migration
  def change
    create_table :raiders do |t|
      t.string :name
      t.string :lastName
      t.string :rut
      t.boolean :acceptedTerms

      t.timestamps null: false
    end
  end
end
