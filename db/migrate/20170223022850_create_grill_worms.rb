class CreateGrillWorms < ActiveRecord::Migration
  def change
    create_table :grill_worms do |t|
      t.belongs_to :worm, index: true, foreign_key: true
      t.integer :can_take
      t.integer :is_dead

      t.timestamps null: false
    end
  end
end
