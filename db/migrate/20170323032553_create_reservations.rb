class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :contact_nmber
      t.datetime :date_of_reservation

      t.timestamps null: false
    end
  end
end
