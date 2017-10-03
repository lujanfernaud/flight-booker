class ChangeNameToFirstNameInPassengers < ActiveRecord::Migration[5.1]
  def change
    rename_column :passengers, :name, :first_name
  end
end
