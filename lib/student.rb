require_relative "../config/environment.rb"
require 'pry'

class Student
  attr_reader :id, :name, :grade

  def initialize(name, grade, id = nil)
    @id = id
    @name = name
    @grade = grade
  end

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade TEXT
      );
    SQL

    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql = "DROP TABLE IF EXISTS students;"

    DB[:conn].execute(sql)
  end

  def save
    sql = <<-SQL
      INSERT INTO students (name, grade)
      VALUES (?, ?);
    SQL

    DB[:conn].execute(sql, self.name, self.grade)

    @id = DB[:conn].execute("SELECT last_insert_rowid()")[0][0]
  end

  def self.create(name:, grade:)
    student = self.new(name, grade)
    student.save
  end

  def self.new_from_db(row)
    student = self.new(row[0], row[1], row[2])
  end
end
