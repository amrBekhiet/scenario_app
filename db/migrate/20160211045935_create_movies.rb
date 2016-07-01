class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :image	
      t.text :description
      t.text :scenario	
      t.timestamps null: false
    end
  end
end
