class User < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name_first
      t.string :name_last
      t.string :email
      t.string :password
      t.string :sms_phone
      t.timestamps null: false
    end
  end
end
