class NotificationTable < ActiveRecord::Migration
  def change
    create_table "notifications", force: :cascade do |t|
        t.string  "description"
        t.boolean "read_status"
        t.datetime "created_at",       null: false
        t.datetime "updated_at",       null: false
    end
  end
end
