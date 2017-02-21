class CreateGrills < ActiveRecord::Migration
  def change
    create_table :grills do |t|
      t.belongs_to :game_state, index: true, foreign_key: true
      t.references :grill_worm_tiles, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
