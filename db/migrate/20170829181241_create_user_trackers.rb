class CreateUserTrackers < ActiveRecord::Migration[5.0]
  def change
    create_table :user_trackers do |t|
      t.references :user, foreign_key: true
      t.references :tracker, foreign_key: true

      t.timestamps
    end
  end
end
