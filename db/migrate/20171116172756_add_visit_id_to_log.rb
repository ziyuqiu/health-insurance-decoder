class AddVisitIdToLog < ActiveRecord::Migration[5.1]
  def change
    add_column :logs, :visit_id, :integer
  end
end
