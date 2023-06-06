class CreateAttendaces < ActiveRecord::Migration[7.0]
  def change
    create_table :attendaces do |t|
      t.references :user, null: false, foreign_key: true
      t.references :concert, null: false, foreign_key: true

      t.timestamps
    end
  end
end
