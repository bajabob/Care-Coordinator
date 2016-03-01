class EmailLink < ActiveRecord::Migration
  def change
    create_table :email_links do |t|
      t.string :auth_token
      t.string :to_email
      t.string :to_name
      t.belongs_to :user, :class_name => "User", :foreign_key => "user_id"
      t.timestamps null: false
    end
  end
end
