class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :content
      t.datetime :start_at, null: false
      t.datetime :finish_at, null: false
      t.integer :kind, null: false
      t.boolean :finished, default: false, null: false
      t.references :member , foreign_key: true
      t.references :room , foreign_key: true
      t.integer :time_required, null: false
      t.timestamps
    end
  end
end
