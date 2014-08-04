require_relative '../../config/database.rb'
require_relative '../../config/environment.rb'

class CreateTables < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.belongs_to :president
      t.string :quote
    end

    create_table :presidents do |t|
      t.string :name
      t.string :nickname
    end
  end
end