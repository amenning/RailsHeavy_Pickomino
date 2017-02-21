class AddForeignKeyToImages < ActiveRecord::Migration
  def change
    add_foreign_key :images, :themes
  end
end
