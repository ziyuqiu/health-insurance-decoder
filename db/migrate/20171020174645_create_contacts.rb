class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :phone
      t.string :street
      t.string :street2
      t.string :state
      t.string :country
      t.string :zipcode
      t.string :fax

      t.timestamps
    end
  end
end
