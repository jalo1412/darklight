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

ActiveRecord::Schema.define(version: 20171017091235) do

  create_table "attendances", force: :cascade do |t|
    t.integer "Status_of_attendance_id"
    t.integer "Lecture_course_entry_id"
    t.integer "Student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Lecture_course_entry_id"], name: "index_attendances_on_Lecture_course_entry_id"
    t.index ["Status_of_attendance_id"], name: "index_attendances_on_Status_of_attendance_id"
    t.index ["Student_id"], name: "index_attendances_on_Student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "level"
    t.string "section"
    t.integer "graduation_year"
    t.integer "Teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Teacher_id"], name: "index_courses_on_Teacher_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.date "date"
    t.string "title"
    t.string "content"
    t.integer "Type_of_evaluation_id"
    t.integer "Lecture_course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Lecture_course_id"], name: "index_evaluations_on_Lecture_course_id"
    t.index ["Type_of_evaluation_id"], name: "index_evaluations_on_Type_of_evaluation_id"
  end

  create_table "grades", force: :cascade do |t|
    t.integer "grade"
    t.integer "Evaluation_id"
    t.integer "Student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Evaluation_id"], name: "index_grades_on_Evaluation_id"
    t.index ["Student_id"], name: "index_grades_on_Student_id"
  end

  create_table "lecture_course_entries", force: :cascade do |t|
    t.integer "number"
    t.date "date"
    t.time "time"
    t.text "description"
    t.integer "Lecture_course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Lecture_course_id"], name: "index_lecture_course_entries_on_Lecture_course_id"
  end

  create_table "lecture_courses", force: :cascade do |t|
    t.integer "Course_id"
    t.integer "Lecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Course_id"], name: "index_lecture_courses_on_Course_id"
    t.index ["Lecture_id"], name: "index_lecture_courses_on_Lecture_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.integer "year"
    t.string "name"
    t.string "program"
    t.string "level"
    t.integer "Teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Teacher_id"], name: "index_lectures_on_Teacher_id"
  end

  create_table "notes", force: :cascade do |t|
    t.date "date"
    t.string "description"
    t.integer "Student_id"
    t.integer "Lecture_course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Lecture_course_id"], name: "index_notes_on_Lecture_course_id"
    t.index ["Student_id"], name: "index_notes_on_Student_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "mobil_phone"
    t.integer "User_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["User_id"], name: "index_parents_on_User_id"
  end

  create_table "status_of_attendances", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "matricule_number"
    t.string "blood_type"
    t.string "allergy"
    t.integer "Parent_id"
    t.integer "Course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Course_id"], name: "index_students_on_Course_id"
    t.index ["Parent_id"], name: "index_students_on_Parent_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.integer "User_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["User_id"], name: "index_teachers_on_User_id"
  end

  create_table "type_of_evaluations", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_of_users", force: :cascade do |t|
    t.string "type_of_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.integer "Type_of_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Type_of_user_id"], name: "index_users_on_Type_of_user_id"
  end

end
