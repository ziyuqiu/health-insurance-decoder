class RemoveEmailFromContact < ActiveRecord::Migration[5.1]
  def change
  	remove_column :contacts, :email
  end
end
