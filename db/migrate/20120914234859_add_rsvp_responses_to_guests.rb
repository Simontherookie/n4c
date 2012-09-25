class AddRsvpResponsesToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :rsvp_wedding, :boolean
    add_column :guests, :rsvp_reception, :boolean
    add_column :guests, :rsvp_bbq, :boolean
  end
end
