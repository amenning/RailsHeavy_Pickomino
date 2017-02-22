class CreateGameStates < ActiveRecord::Migration
  def change
    create_table :game_states do |t|
      t.belongs_to :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
