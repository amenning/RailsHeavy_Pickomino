class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :target
      t.string :filename
      t.string :filetype
      t.string :description
      t.belongs_to :theme, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
