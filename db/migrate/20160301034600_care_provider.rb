class CareProvider < ActiveRecord::Migration
  def change
    create_table :care_providers do |t|
      t.string :office_name
      t.string :office_phone
      t.string :office_phone_ext
      t.string :office_email
      t.string :address_line_one
      t.string :address_line_two
      t.string :city
      t.string :state
      t.string :zip
      t.string :physician_name
      t.timestamps null: false
    end
  end
end
