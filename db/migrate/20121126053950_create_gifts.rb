class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name, :null => false
      t.string :description
      t.string :category
      t.references :guest

      t.timestamps
    end
    add_index :gifts, :category
    add_index :gifts, :guest_id
  end
end
