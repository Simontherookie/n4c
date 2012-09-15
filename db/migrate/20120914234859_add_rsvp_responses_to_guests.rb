class AddRsvpResponsesToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :rsvp_wedding, :boolean, :default => false
    add_column :guests, :rsvp_reception, :boolean, :default => false
    add_column :guests, :rsvp_bbq, :boolean, :default => false
  end
end
