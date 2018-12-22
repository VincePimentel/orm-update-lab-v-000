require_relative "../config/environment.rb"

class Student
  def initialize(name, grade, id = nil )
    @id = id
    @name = name
    @grade = grade
  end
end
