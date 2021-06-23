class CreateTimeTables < ActiveRecord::Migration[6.0]
  def change
    create_table :time_tables do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :stage, default: 2
      t.text :commitment

      t.timestamps
    end
  end
end
