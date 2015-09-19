class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.belongs_to :raider, index: true
      t.date :date

      t.timestamps null: false
    end
  end
end
