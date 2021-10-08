class ChangeCreateCatToCats < ActiveRecord::Migration[5.2]
  def change
    rename_table :create_cats, :cats
  end
end
