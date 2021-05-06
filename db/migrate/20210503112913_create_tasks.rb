class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.boolean :is_finished
      t.text :memo

      t.timestamps
    end
  end
end
