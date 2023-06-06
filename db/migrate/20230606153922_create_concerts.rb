class CreateConcerts < ActiveRecord::Migration[7.0]
  def change
    create_table :concerts do |t|
      t.string :city
      t.string :venue
      t.date :date
      t.float :average_rating
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
