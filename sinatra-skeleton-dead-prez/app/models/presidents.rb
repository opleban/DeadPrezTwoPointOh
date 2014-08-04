require_relative '../../config/environment.rb'

class President < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :quotes
  has_many :call_logs
end