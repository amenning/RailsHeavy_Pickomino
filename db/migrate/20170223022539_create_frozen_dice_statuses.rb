class CreateFrozenDiceStatuses < ActiveRecord::Migration
  def change
    create_table :frozen_dice_statuses do |t|
      t.belongs_to :game, index: true, foreign_key: true
      t.integer :total
      t.integer :has_worm

      t.timestamps null: false
    end
  end
end
