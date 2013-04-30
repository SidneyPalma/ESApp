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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130429160810) do

  create_table "alunos", :force => true do |t|
    t.string   "nome",       :limit => 60
    t.string   "fone",       :limit => 20
    t.date     "nascimento"
    t.date     "batismo"
    t.string   "email"
    t.text     "endereco"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "unidade_id"
  end

  create_table "apontamentos", :force => true do |t|
    t.integer  "trimestre_id"
    t.integer  "unidade_id"
    t.integer  "aluno_id"
    t.boolean  "sab01"
    t.boolean  "sab02"
    t.boolean  "sab03"
    t.boolean  "sab04"
    t.boolean  "sab05"
    t.boolean  "sab06"
    t.boolean  "sab07"
    t.boolean  "sab08"
    t.boolean  "sab09"
    t.boolean  "sab10"
    t.boolean  "sab11"
    t.boolean  "sab12"
    t.boolean  "sab13"
    t.boolean  "sab14"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "pergunta", :force => true do |t|
    t.string   "pergunta",   :limit => 60
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "resposta", :force => true do |t|
    t.integer  "trimestre_id"
    t.integer  "unidade_id"
    t.integer  "pergunta_id"
    t.integer  "sab01"
    t.integer  "sab02"
    t.integer  "sab03"
    t.integer  "sab04"
    t.integer  "sab05"
    t.integer  "sab06"
    t.integer  "sab07"
    t.integer  "sab08"
    t.integer  "sab09"
    t.integer  "sab10"
    t.integer  "sab11"
    t.integer  "sab12"
    t.integer  "sab13"
    t.integer  "sab14"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "tipoclasses", :force => true do |t|
    t.string   "sigla",      :limit => 5
    t.string   "descricao",  :limit => 30
    t.integer  "idadede"
    t.integer  "idadeate"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "trimestres", :force => true do |t|
    t.string   "trimestre",    :limit => 5
    t.integer  "ano"
    t.integer  "trim",         :limit => 2
    t.integer  "qtde_sabados", :limit => 2
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.boolean  "ativo"
  end

  create_table "unidades", :force => true do |t|
    t.string   "nome"
    t.integer  "tipoclasse_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "professor",     :limit => 60
    t.string   "associado",     :limit => 60
    t.string   "secretario",    :limit => 60
  end

end
