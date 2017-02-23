class CreateFrozenDices < ActiveRecord::Migration
  def change
    create_table :frozen_dices do |t|
      t.belongs_to :frozen_dice_set, index: true, foreign_key: true
      t.belongs_to :dice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
