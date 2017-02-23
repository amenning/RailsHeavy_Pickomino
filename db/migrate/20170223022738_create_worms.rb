class CreateWorms < ActiveRecord::Migration
  def change
    create_table :worms do |t|
      t.integer :value
      t.integer :worm_count

      t.timestamps null: false
    end
  end
end
