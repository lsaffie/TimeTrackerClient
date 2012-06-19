# only run this if db doesn't exist
ActiveRecord::Schema.define do
  create_table "tasks", :force => true do |t|
    t.string    "name"
    t.datetime  "start_time"
    t.datetime  "end_time"
    t.float     "total"
    t.datetime  "created_at"
    t.datetime  "updated_at"
    t.integer   "customer_id"
  end

  create_table "customers", :force => true do |t|
    t.string    "name"
    t.datetime  "created_at"
    t.datetime  "updated_at"
  end

end
