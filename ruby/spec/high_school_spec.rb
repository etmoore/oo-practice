require_relative './spec_helper'
require_relative '../highschool'

RSpec.describe HighSchool do

  def create_high_school
    capacity = rand(100)
    HighSchool.new(capacity)
  end

  it "enrolls students" do
    high_school = create_high_school
    expect(high_school.vacancies).to eq(high_school.capacity)

    high_school.enroll("Lindsay Weir")
    expect(high_school.vacancies).to eq(high_school.capacity - 1)
  end

  it "reports the list of enrolled students" do
    high_school = create_high_school

    high_school.enroll("Lindsay Weir")
    high_school.enroll("Sam Weir")
    high_school.enroll("Daniel Desario")
    expect(high_school.students).to eq(["Lindsay Weir", "Sam Weir", "Daniel Desario"])

    high_school.enroll("Andy Nguyen")
    expect(high_school.students).to eq(["Lindsay Weir", "Sam Weir", "Daniel Desario", "Andy Nguyen"])

  end

  it "drops a student" do
    high_school = create_high_school

    high_school.enroll("Lindsay Weir")
    high_school.enroll("Daniel Desario")

    high_school.drop_out("Daniel Desario")
    expect(high_school.students).to eq(["Lindsay Weir"])

    high_school.drop_out("Lindsay Weir")
    expect(high_school.students).to eq([])

  end

  it "reports a list of dropped students" do
    high_school = create_high_school

    high_school.enroll("Lindsay Weir")
    high_school.enroll("Daniel Desario")

    high_school.drop_out("Daniel Desario")
    expect(high_school.dropped_out).to eq(["Daniel Desario"])

    high_school.drop_out("Lindsay Weir")
    expect(high_school.dropped_out).to eq(["Daniel Desario", "Lindsay Weir"])
  end

  it "graduates students" do
    high_school = create_high_school

    high_school.enroll("Lindsay Weir")
    high_school.enroll("Daniel Desario")
    high_school.graduate("Lindsay Weir")

    expect(high_school.alumni).to eq(["Lindsay Weir"])
    expect(high_school.students).to eq(["Daniel Desario"])

    high_school.enroll("Lebron James")
    high_school.graduate("Daniel Desario")

    expect(high_school.alumni).to eq(["Lindsay Weir", "Daniel Desario"])
    expect(high_school.students).to eq(["Lebron James"])

  end


end
