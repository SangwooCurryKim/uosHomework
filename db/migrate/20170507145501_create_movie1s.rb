class CreateMovie1s < ActiveRecord::Migration
  def change
    create_table :movie1s do |t|
      t.string :title
      t.string :year
      t.string :poster
      t.string :director

      t.timestamps null: false
    end
  end
end
