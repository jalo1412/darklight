class SonController < ApplicationController
  def index
    usuarioid = session[:user_id]
    parent = Parent.where(User_id: usuarioid)
    @sons = Student.where(Parent_id: parent).all
    @snotes = Note.where(Student_id: @sons)
    @sgrades = Grade.where(Student_id: @sons)

end
end
