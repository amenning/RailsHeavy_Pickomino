class CreateGamestates < ActiveRecord::Migration
  def change
    create_table :gamestates do |t|
      t.belongs_to :game, index: true, foreign_key: true
      t.belongs_to :phase, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
