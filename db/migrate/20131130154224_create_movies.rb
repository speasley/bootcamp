class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :studio_id
      t.integer :year
      t.timestamps
    end
  end
end
