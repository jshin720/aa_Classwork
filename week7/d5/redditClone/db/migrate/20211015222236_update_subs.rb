class UpdateSubs < ActiveRecord::Migration[5.2]
  def change
    add_column :subs, :moderator_id, :integer, null: false
    add_index :subs, :moderator_id
  end

end
