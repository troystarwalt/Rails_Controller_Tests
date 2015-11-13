class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :number
      t.text :type
      t.integer :expires_month
      t.integer :expires_year
      t.text :code

      t.timestamps null: false
    end
  end
end
