require_relative "../config/environment.rb"

class Student
  attr_reader :name, :grade, :id

  def initialize(name, grade, id = nil)
    @id = id
    @name = name
    @grade = grade
  end

  def self.create_table

  end
end
