class CreateWormTiles < ActiveRecord::Migration
  def change
    create_table :worm_tiles do |t|
      t.integer :value
      t.integer :worm_count
      t.belongs_to :image, index: true, foreign_key: true
      t.belongs_to :theme, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
