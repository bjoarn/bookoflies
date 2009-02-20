class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :name
      t.text :description
      t.string :street_address
      t.string :extended_address
      t.string :email
      t.string :phone
      t.string :zip
      t.string :city
      t.string :web_address
      t.string :mixer
      t.string :pa_system
      t.string :monitor_system
      t.string :monitor_mixer
      t.text :outboard

      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
