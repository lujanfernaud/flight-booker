class ChangeDatetimeColumnToDateInFlights < ActiveRecord::Migration[5.1]
  def change
    change_column :flights, :departure_date, :date
  end
end
