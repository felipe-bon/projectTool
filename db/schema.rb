# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_29_041751) do
  create_table "membros", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "projeto_id", null: false
    t.string "cargo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "adm"
    t.index ["projeto_id"], name: "index_membros_on_projeto_id"
    t.index ["user_id"], name: "index_membros_on_user_id"
  end

  create_table "projetos", force: :cascade do |t|
    t.string "nome"
    t.string "codigo_de_acesso"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tarefas", force: :cascade do |t|
    t.text "descricao_tarefa"
    t.integer "etapa"
    t.integer "prioridade"
    t.integer "projeto_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.date "vencimento"
    t.index ["projeto_id"], name: "index_tarefas_on_projeto_id"
    t.index ["user_id"], name: "index_tarefas_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nome"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "membros", "projetos"
  add_foreign_key "membros", "users"
  add_foreign_key "tarefas", "Projetos", column: "projeto_id"
  add_foreign_key "tarefas", "users"
end