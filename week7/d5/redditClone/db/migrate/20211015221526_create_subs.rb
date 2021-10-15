class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.timestamps
    end

    add_index :subs, :title, unique: true
  end
end
