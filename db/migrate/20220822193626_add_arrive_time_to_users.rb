class AddArriveTimeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :arrive_time, :datetime
  end
end
