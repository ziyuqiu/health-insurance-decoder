class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :link
      t.string :category
      t.string :description
      t.string :date
      t.string :weekday
      t.string :date
      t.string :time
      t.string :location
      t.string :other

      t.timestamps
    end
  end
end
