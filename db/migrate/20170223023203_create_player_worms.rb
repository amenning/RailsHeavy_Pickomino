class CreatePlayerWorms < ActiveRecord::Migration
  def change
    create_table :player_worms do |t|
      t.belongs_to :player_worm_set, index: true, foreign_key: true
      t.belongs_to :worm, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
