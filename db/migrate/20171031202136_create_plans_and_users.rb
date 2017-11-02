class CreatePlansAndUsers < ActiveRecord::Migration[5.1]
  def change
      create_table :plans_users, id: false do |t|
          t.belongs_to :plan, index: true
          t.belongs_to :user, index: true
    end
  end
end
