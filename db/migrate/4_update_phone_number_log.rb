class UpdatePhoneNumberLog < ActiveRecord::Migration
  def change
  	change_column :call_logs, :number, :string
  end
end
