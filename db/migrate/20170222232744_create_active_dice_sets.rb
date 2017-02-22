class CreateActiveDiceSets < ActiveRecord::Migration
  def change
    create_table :active_dice_sets do |t|
      t.belongs_to :game_state, index: true, foreign_key: true
      t.belongs_to :dice, index: true, foreign_key: true
      t.integer :can_freeze

      t.timestamps null: false
    end
  end
end
