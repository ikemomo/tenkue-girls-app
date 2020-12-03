class AddUserImformationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :integer
    add_column :users, :engineer_history, :integer
    add_column :users, :marriage, :string
    add_column :users, :childcare, :string
    add_column :users, :care, :boolean
    add_column :users, :employment_status, :string
  end
end
