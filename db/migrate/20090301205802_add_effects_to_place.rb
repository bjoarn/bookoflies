class AddEffectsToPlace < ActiveRecord::Migration
  def self.up
    add_column :places, :effects, :string
  end

  def self.down
    remove_column :places, :effects
  end
end
