# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Grade.destroy_all
Evaluation.destroy_all
Note.destroy_all
Student.destroy_all
Parent.destroy_all
LectureCourse.destroy_all
Course.destroy_all
Lecture.destroy_all
Teacher.destroy_all
TypeOfEvaluation.destroy_all
User.destroy_all
TypeOfUser.destroy_all

papas = []
estudiantes = []
cursos = []
profes = []
topics = ["Maths", "Sport"]
lecturas = []
lecturasCursos = []
evaluaciones = []
tiposDeUsuarios = []
usuariosPapas = []
usuariosProfes = []
estados = ["Present", "Absent", "Late", "Excused"]
tiposDeEstados = []
# TypesoStatus####################################################################

tiposDeEstados = StatusOfAttendance.create ([{status: estados[0]},
                                              {status: estados[1]},
                                              {status: estados[2]},
                                              {status: estados[3]}])


# Typesofuser####################################################################

tiposDeUsuarios = TypeOfUser.create([{ type_of_user: 'Administrator', id: 1 },
                                     { type_of_user: 'Parent', id: 2 },
                                     { type_of_user: 'Teacher', id: 3 }])
# user###########################################################################
User.create(name: 'admin', password: '123456', Type_of_user_id:
            tiposDeUsuarios[0].id)
usuariosPapas.push User.create(name: 'parent', password: '123456',
                               Type_of_user_id: tiposDeUsuarios[1].id)
usuariosPapas.push User.create(name: 'John', password: '123456',
                               Type_of_user_id: tiposDeUsuarios[1].id)
usuariosProfes.push User.create(name: 'teacher', password: '123456',
                                Type_of_user_id: tiposDeUsuarios[2].id)
usuariosProfes.push User.create(name: 'Deborah', password: '123456',
                                Type_of_user_id: tiposDeUsuarios[2].id)
# Typeofevaluations##############################################################
tiposEvaluacion = TypeOfEvaluation.create([{ name: 'Test', weight: 60 }, { name: 'Exam', weight: 40 }])

# Teacher########################################################################
profes.push(Teacher.create(name: Faker::Name.first_name,
                           last_name: Faker::Name.last_name,
                           email: Faker::Internet.unique.email,
                           User_id: usuariosProfes [1].id))
(0..20).each do |_i|
  profes.push(Teacher.create(name: Faker::Name.first_name,
                             last_name: Faker::Name.last_name,
                             email: Faker::Internet.unique.email,
                             User_id: usuariosProfes [0].id))
end

# Course#########################################################################
(1..8).each do |i|
  t = 0
  cursos.push Course.create(level: i.to_s,
                            section: 'A',
                            graduation_year: i + 2017,
                            Teacher_id: profes[i-1].id)
  cursos.push Course.create(level: i.to_s,
                            section: 'B',
                            graduation_year: i + 2017,
                            Teacher_id: profes[18 - i].id)
end

# Lecture########################################################################
(1..8).each do |i|
  topics.each do |j|
    lecturas.push Lecture.create(year: 2017,
                                 name: j,
                                 program: 'teaches' + j,
                                 level: i.to_s,
                                 Teacher_id: profes[i-1].id)
  end
end

# Lecture_Courses################################################################
cursos.each do |c|
  lecturas.each do |l|
    if c.level == l.level
      lecturasCursos.push LectureCourse.create(Course_id: c.id, Lecture_id: l.id)
    end
  end
end

# evaluations####################################################################
lecturasCursos.each do |l|
  tiposEvaluacion.each do |t|
    evaluaciones.push(Evaluation.create(date: Faker::Date.between(300.days.ago,
                                                                  Date.today),
                                        title: t.name + l.Lecture.name,
                                        content: 'Unit x',
                                        Type_of_evaluation_id: t.id,
                                        Lecture_course_id: l.id))
  end
end

# Parent#########################################################################
(0..20).each do |_i|
  papas.push Parent.create(name: Faker::Name.name,
                           email: Faker::Internet.unique.email,
                           mobil_phone: Faker::PhoneNumber.cell_phone,
                           User_id: usuariosPapas [0].id)
end
papas.push Parent.create(name: Faker::Name.name,
                         email: Faker::Internet.unique.email,
                         mobil_phone: Faker::PhoneNumber.cell_phone,
                         User_id: usuariosPapas [1].id)

# Student########################################################################
bloodTypes = %w[A B AB 0]

cursos.each do |c|
  (1..5).each do |j|
    estudiantes.push Student.create(name: Faker::Name.first_name,
                                    last_name: Faker::Name.last_name,
                                    matricule_number: j.to_s + c.section,
                                    blood_type: bloodTypes[rand(3)],
                                    allergy: 'None',
                                    Parent_id: papas[rand(22)].id,
                                    Course_id: c.id)
  end
end
# Grade##########################################################################
estudiantes.each do |es|
  evaluaciones.each do |ev|
    if ev.Lecture_course.Course.level == es.Course.level && ev.Lecture_course.Course.section == es.Course.section
      Grade.create(grade: rand(4) + 1, Evaluation_id: ev.id, Student_id: es.id)
    end
  end
end
# Note###########################################################################
(0..70).each do |_i|
  Note.create(
    date: Faker::Date.between(300.days.ago, Date.today),
    description: 'the student did very good',
    Student_id: estudiantes[rand(70)].id,
    Lecture_course_id: lecturasCursos[rand(30)].id
  )
end
(0..80).each do |_i|
  Note.create(
    date: Faker::Date.between(300.days.ago, Date.today),
    description: 'the student did had a very bad behavior',
    Student_id: estudiantes[rand(70)].id,
    Lecture_course_id: lecturasCursos[rand(30)].id
  )
end
