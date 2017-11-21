class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.string :type
      t.date :time

      t.timestamps
    end
  end
end
