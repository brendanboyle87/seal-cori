class CreateUnsealableCrimes < ActiveRecord::Migration
  def change
    create_table :unsealable_crimes do |t|
      t.string :offense_name, null: false
    end
    add_index :unsealable_crimes, :offense_name, unique: true
  end
end
