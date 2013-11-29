class CreateStudios < ActiveRecord::Migration
  def change
    create_table :studios do |t|
      t.string :title
    end
  end
end
