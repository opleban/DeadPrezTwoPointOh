class AddPresidentId < ActiveRecord::Migration
  def change
  	add_column :call_logs, :president_id, :integer
  end
end
