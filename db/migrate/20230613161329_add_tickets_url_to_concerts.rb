class AddTicketsUrlToConcerts < ActiveRecord::Migration[7.0]
  def change
    add_column :concerts, :tickets_url, :string
  end
end
