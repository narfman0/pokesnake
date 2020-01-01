# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_01_040450) do

  create_table "pokemons", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "height"
    t.integer "weight"
  end

  create_table "pokemons_types", id: false, force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "type_id", null: false
    t.index ["pokemon_id", "type_id"], name: "index_pokemons_types_on_pokemon_id_and_type_id"
    t.index ["type_id", "pokemon_id"], name: "index_pokemons_types_on_type_id_and_pokemon_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
  end

end
