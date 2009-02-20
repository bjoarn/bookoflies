class CreateEmployments < ActiveRecord::Migration
  def self.up
    create_table :employments do |t|
      t.integer :person_id
      t.integer :place_id

      t.timestamps
    end
  end

  def self.down
    drop_table :employments
  end
end
