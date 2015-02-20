class HighSchool

  attr_reader :vacancies, :capacity, :students

  def initialize(capacity)
    @capacity = capacity
    @vacancies = capacity
    @students = []
    @bad_students = []
    @graduation_list = []
  end

  def enroll(student)
    @vacancies -= 1
    @students << student
  end

  def drop_out(bad_student)
    @students.delete(bad_student)
    @bad_students << bad_student
  end

  def dropped_out
    @bad_students
  end

  def graduate(good_student)
    @graduation_list << good_student
    @students.delete(good_student)
  end

  def alumni
    @graduation_list
  end

end
