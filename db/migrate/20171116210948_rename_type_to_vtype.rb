class RenameTypeToVtype < ActiveRecord::Migration[5.1]
  def change
  	remove_column :visits, :type
  	add_column :visits, :vtype, :string
  end
end
