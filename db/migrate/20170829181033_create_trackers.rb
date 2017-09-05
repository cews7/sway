class CreateTrackers < ActiveRecord::Migration[5.0]
  def change
    create_table :trackers do |t|
      t.string :name
      t.string :purpose

      t.timestamps
    end
  end
end
