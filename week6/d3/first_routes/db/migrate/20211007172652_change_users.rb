class ChangeUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :name, :username
    remove_column :users, :email
  end
end
