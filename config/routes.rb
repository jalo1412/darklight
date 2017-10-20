Rails.application.routes.draw do
  get 'teacherv/my_lectures_course_entries'

  get 'teacherv/attending'

  get 'teacherv/teaching'

  resources :attendances
  resources :status_of_attendances
  resources :lecture_course_entries
  get 'teacherv/index'

  get 'son' => 'son#index'
  get 'admin' => 'admin#index'
  get 'parent'=> 'parent#index'
  get 'resume' => 'son#resume'
  get 'addLectureEntry' => 'lecture_course_entry#add'
  get 'teacherv' => 'teacherv#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :type_of_users
  resources :type_of_evaluations
  resources :lecture_courses
  resources :evaluations
  resources :grades
  resources :lectures
  resources :teachers
  resources :notes
  resources :students
  resources :courses
  resources :parents
  get 'home/index'

  root :to => "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
