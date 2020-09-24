class CreateTimeRequireds < ActiveRecord::Migration[5.2]
  def change
    create_table :time_requireds do |t|

      t.timestamps
    end
  end
end
