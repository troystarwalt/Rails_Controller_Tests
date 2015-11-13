class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email
      t.text :phone
      t.text :fname
      t.text :lname
      t.decimal :balance

      t.timestamps null: false
    end
  end
end
