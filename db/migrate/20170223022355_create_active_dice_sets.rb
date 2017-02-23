class CreateActiveDiceSets < ActiveRecord::Migration
  def change
    create_table :active_dice_sets do |t|
      t.belongs_to :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
