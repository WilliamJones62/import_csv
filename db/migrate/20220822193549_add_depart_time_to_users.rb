class AddDepartTimeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :depart_time, :datetime
  end
end
