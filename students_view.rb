class StudentsView
  def display(students)
    students.each_with_index do |student, index|
      puts "#{index + 1} - #{student.name.capitalize} is in course #{student.course_id.zero? ? "not assigned" : student.course_id}"
    end
  end

  def ask_user_to_add_student_name
    puts "What's the name of the student?"
    gets.chomp
  end

  def ask_user_to_add_student_age
    puts "What's the age of the student?"
    gets.chomp.to_i
  end

  def ask_user_to_add_student_level
    puts "What's the level of the student?"
    gets.chomp.to_f
  end

  def ask_user_to_select_student
    puts "Which student?"
    gets.chomp.to_i - 1
  end

  def ask_user_to_add_student_to_course
    puts "Which course?"
    gets.chomp.to_i
  end
end
