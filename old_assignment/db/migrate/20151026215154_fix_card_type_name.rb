class FixCardTypeName < ActiveRecord::Migration
  def change
rename_column :cards, :type, :cardtype

  end

end
