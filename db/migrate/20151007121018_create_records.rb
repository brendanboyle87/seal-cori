class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string  :crime_name, null: false
      t.boolean :felony
      t.boolean :misdemeanor
      t.boolean  :convicted, null: false
      t.date :disposition_date, null: false
      t.belongs_to :user, null: false, index: true

      t.timestamps
    end
  end
end
