class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :stage_place
      t.datetime :appearance_time
      t.references :artist, null: false, foreign_key: true
      t.references :time_table, null: false, foreign_key: true

      t.timestamps
    end
  end
end
