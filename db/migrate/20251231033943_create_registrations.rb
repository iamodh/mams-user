class CreateRegistrations < ActiveRecord::Migration[8.1]
  def change
    create_table :registrations do |t|
      t.references :course, null: false, foreign_key: true
      t.string :name
      t.date :date_of_birth
      t.string :address
      t.string :phone
      t.integer :status

      t.timestamps

      t.index [ :course_id, :phone ], unique: true
    end
  end
end
