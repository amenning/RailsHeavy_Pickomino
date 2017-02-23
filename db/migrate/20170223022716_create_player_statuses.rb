class CreatePlayerStatuses < ActiveRecord::Migration
  def change
    create_table :player_statuses do |t|
      t.belongs_to :game, index: true, foreign_key: true
      t.belongs_to :player, index: true, foreign_key: true
      t.integer :score

      t.timestamps null: false
    end
  end
end
