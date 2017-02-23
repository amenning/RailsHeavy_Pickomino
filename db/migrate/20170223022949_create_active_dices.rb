class CreateActiveDices < ActiveRecord::Migration
  def change
    create_table :active_dices do |t|
      t.belongs_to :active_dice_set, index: true, foreign_key: true
      t.belongs_to :dice, index: true, foreign_key: true
      t.integer :can_freeze

      t.timestamps null: false
    end
  end
end
