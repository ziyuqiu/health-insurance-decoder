class AddDeductiblesToPlans < ActiveRecord::Migration[5.1]
  def change
      remove_column :plans, :deductible
      add_column :plans, :in_deductible, :float
      add_column :plans, :out_deductible, :float
  end
end
