class Comment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :poster_email
      t.string :poster_name
      t.string :comment
      t.belongs_to :itinerary, :class_name => "Itinerary", :foreign_key => "itinerary_id"
      t.timestamps null: false
    end
  end
end
