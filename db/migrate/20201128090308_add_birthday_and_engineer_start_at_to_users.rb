class AddBirthdayAndEngineerStartAtToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthday, :date
    add_column :users, :engineer_start_at, :date
  end
end
