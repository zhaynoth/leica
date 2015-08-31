# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150815212305) do

  create_table "attentions", force: true do |t|
    t.string   "reportby"
    t.datetime "dateinc"
    t.datetime "datefin"
    t.integer  "type_id"
    t.float    "horas",       limit: 24
    t.float    "horashombre", limit: 24
    t.integer  "contract_id"
    t.string   "report"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attentions", ["contract_id"], name: "attentions_contract_id_fk", using: :btree
  add_index "attentions", ["type_id"], name: "attentions_type_id_fk", using: :btree
  add_index "attentions", ["user_id"], name: "index_attentions_on_user_id", using: :btree

  create_table "contract_workers", force: true do |t|
    t.integer  "contract_id"
    t.integer  "worker_id"
    t.string   "estado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contract_workers", ["contract_id"], name: "index_contract_workers_on_contract_id", using: :btree
  add_index "contract_workers", ["worker_id"], name: "index_contract_workers_on_worker_id", using: :btree

  create_table "contracts", force: true do |t|
    t.string  "nombre"
    t.integer "project_id"
  end

  add_index "contracts", ["project_id"], name: "contracts_project_id_fk", using: :btree

  create_table "guards", force: true do |t|
    t.string "guardia"
  end

  create_table "involveds", force: true do |t|
    t.integer  "worker_id"
    t.integer  "attention_id"
    t.string   "rol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "involveds", ["attention_id"], name: "index_involveds_on_attention_id", using: :btree
  add_index "involveds", ["worker_id"], name: "index_involveds_on_worker_id", using: :btree

  create_table "projects", force: true do |t|
    t.string "nombre"
    t.string "ubicacion"
  end

  create_table "swatenttions", force: true do |t|
    t.text     "issue"
    t.integer  "type_id"
    t.integer  "priority"
    t.text     "comment"
    t.integer  "unity_id"
    t.integer  "attention_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "swatenttions", ["attention_id"], name: "index_swatenttions_on_attention_id", using: :btree
  add_index "swatenttions", ["priority"], name: "swatenttions_priority_fk", using: :btree
  add_index "swatenttions", ["type_id"], name: "swatenttions_type_id_fk", using: :btree
  add_index "swatenttions", ["unity_id"], name: "swatenttions_unity_id_fk", using: :btree

  create_table "turns", force: true do |t|
    t.string "turno"
  end

  create_table "types", force: true do |t|
    t.string "campo"
    t.string "valor"
  end

  create_table "unities", force: true do |t|
    t.string   "unity"
    t.integer  "unity_subtype_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "unities", ["project_id"], name: "unities_project_id_fk", using: :btree
  add_index "unities", ["unity_subtype_id"], name: "unities_unity_subtype_id_fk", using: :btree

  create_table "unity_subtypes", force: true do |t|
    t.string   "subtype"
    t.integer  "unity_types_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "unity_subtypes", ["unity_types_id"], name: "unity_subtypes_unity_types_id_fk", using: :btree

  create_table "unity_types", force: true do |t|
    t.string "type_name"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "permission_level"
    t.integer  "worker_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["worker_id"], name: "index_users_on_worker_id", using: :btree

  create_table "workers", force: true do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "type_id"
    t.string   "fotocheck"
    t.string   "telefono"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "workers", ["type_id"], name: "workers_type_id_fk", using: :btree

  add_foreign_key "attentions", "contracts", name: "attentions_contract_id_fk"
  add_foreign_key "attentions", "types", name: "attentions_type_id_fk"
  add_foreign_key "attentions", "users", name: "attentions_user_id_fk"

  add_foreign_key "contract_workers", "contracts", name: "contract_workers_contract_id_fk"
  add_foreign_key "contract_workers", "workers", name: "contract_workers_worker_id_fk"

  add_foreign_key "contracts", "projects", name: "contracts_project_id_fk"

  add_foreign_key "involveds", "attentions", name: "involveds_attention_id_fk"
  add_foreign_key "involveds", "workers", name: "involveds_worker_id_fk"

  add_foreign_key "swatenttions", "attentions", name: "swatenttions_attention_id_fk"
  add_foreign_key "swatenttions", "types", name: "swatenttions_priority_fk", column: "priority"
  add_foreign_key "swatenttions", "types", name: "swatenttions_type_id_fk"
  add_foreign_key "swatenttions", "unities", name: "swatenttions_unity_id_fk"

  add_foreign_key "unities", "projects", name: "unities_project_id_fk"
  add_foreign_key "unities", "unity_subtypes", name: "unities_unity_subtype_id_fk"

  add_foreign_key "unity_subtypes", "unity_types", name: "unity_subtypes_unity_types_id_fk", column: "unity_types_id"

  add_foreign_key "users", "workers", name: "users_worker_id_fk"

  add_foreign_key "workers", "types", name: "workers_type_id_fk"

end
