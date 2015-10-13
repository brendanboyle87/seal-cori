class CreatePersonalInformations < ActiveRecord::Migration
  def change
    create_table :personal_informations do |t|

      t.string :middle_name
      t.string :previous_name
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :occupation
      t.string :hometown, null: false
      t.string :father_name, null: false
      t.string :mother_maiden
      t.string :spouse_name
      t.string :zip, null: false
      t.belongs_to :user, null: false
      t.string :date_of_birth, null: false

      t.timestamps
    end
  end
end
