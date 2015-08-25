class Purchase < ActiveRecord::Base
  has_many(:customers)
  has_many(:items)

  scope(:between, -> do
    between({:timestamp => start_time, :timestamp => end_time})
  end)
end
