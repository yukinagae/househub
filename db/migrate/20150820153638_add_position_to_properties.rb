class AddPositionToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :position, :string
  end
end
