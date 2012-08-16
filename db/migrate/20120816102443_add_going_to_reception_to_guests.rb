class AddGoingToReceptionToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :going_to_reception, :boolean, :default => false
  end
end
