class AddLastNameToPassengers < ActiveRecord::Migration[5.1]
  def change
    add_column :passengers, :last_name, :string
  end
end
