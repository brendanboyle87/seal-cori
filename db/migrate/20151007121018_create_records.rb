class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.boolean :felony
      t.boolean :misdemeanor
      t.string  :crime_name, null: false
      t.date :date, null: false
      t.belongs_to :user, null: false, index: true

      t.timestamps
    end
  end
end
