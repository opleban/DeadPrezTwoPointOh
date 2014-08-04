require_relative '../../config/environment.rb'

class CallLog < ActiveRecord::Base
  belongs_to :president

end