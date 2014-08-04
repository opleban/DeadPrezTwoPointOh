if production?
  helpers do
    after do
      ActiveRecord::Base.connection.close
    end
  end
end