require_relative '../../config/database.rb'
require_relative '../../config/environment.rb'

class CreateCallLog < ActiveRecord::Migration
  def change
    create_table :call_logs do |t|
      t.string :name
      t.integer :number
    end
  end
end