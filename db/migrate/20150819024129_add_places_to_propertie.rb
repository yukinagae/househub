class AddPlacesToPropertie < ActiveRecord::Migration
  def change
    add_column :properties, :state, :string
    add_column :properties, :region, :string
    add_column :properties, :town, :string
  end
end
