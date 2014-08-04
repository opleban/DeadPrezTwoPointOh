require_relative '../../config/environment.rb'

class Quote < ActiveRecord::Base
  belongs_to :president
end