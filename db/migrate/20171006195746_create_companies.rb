class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :contact_id
      t.string :integer

      t.timestamps
    end
  end
end
