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

ActiveRecord::Schema.define(version: 20150803020044) do

  create_table "attentions", force: true do |t|
    t.string   "reportby"
    t.datetime "dateinc"
    t.datetime "datefin"
    t.integer  "type_id"
    t.integer  "horas"
    t.integer  "horashombre"
    t.integer  "contract_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "turns", force: true do |t|
    t.string "turno"
  end

  create_table "types", force: true do |t|
    t.string "campo"
    t.string "valor"
  end

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

end