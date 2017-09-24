class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  create_table "khachhangss", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 100
    t.string "email", limit: 200
    t.string "phonenumber", limit: 20
    t.string "address", limit: 200
    t.datetime "ngaytao"
    t.datetime "hehehess"
  end

  create_table "detail_orders", primary_key: ["id_order", "id_product"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "id_order", null: false
    t.integer "id_product", null: false
    t.integer "quantity_buy"
    t.integer "total"
    t.index ["id_order", "id_product"], name: "index_detail_orders_on_id_order_and_id_product", unique: true
  end

  create_table "employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", limit: 100
    t.string "address", limit: 200
    t.string "phonenumber", limit: 15
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "day_order"
    t.datetime "day_recieve"
    t.bigint "customer_id"
    t.index ["customer_id"], name: "index_orders_on_customers_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 150
    t.integer "price"
    t.integer "quantity"
    t.text "introduce"
    t.datetime "create_day"
    t.datetime "update_date"
    t.bigint "typeproducts_id"
    t.string "path_name", limit: 50
    t.string "photo", limit: 100
    t.index ["typeproducts_id"], name: "index_products_on_typeproducts_id"
  end

  create_table "typeproducts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 300
    t.string "path_name", limit: 50
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "customers"
  add_foreign_key "products", "typeproducts", column: "typeproducts_id"
end
