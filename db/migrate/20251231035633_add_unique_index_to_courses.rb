class AddUniqueIndexToCourses < ActiveRecord::Migration[8.1]
  def change
    add_index :courses, [:marathon_id, :name], unique: true
  end
end
