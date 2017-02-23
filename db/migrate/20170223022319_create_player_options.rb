class CreatePlayerOptions < ActiveRecord::Migration
  def change
    create_table :player_options do |t|
      t.belongs_to :game, index: true, foreign_key: true
      t.integer :can_roll

      t.timestamps null: false
    end
  end
end
