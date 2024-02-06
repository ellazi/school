class CoursesView
  def display(courses)
    courses.each_with_index do |course, index|
      puts "#{index + 1} - #{course.n_hours} hours of #{course.capacity}, students (#{course.full? ? "FULL" : "AVAILABLE"})"
      puts "Students: #{course.students.map(&:name).join(", ")}"
    end
  end

  def ask_user_to_add_course_n_hours
    puts "How many hours?"
    gets.chomp.to_i
  end

  def ask_user_to_add_course_capacity
    puts "How many students?"
    gets.chomp.to_i
  end

  def ask_user_course_index
    puts "Which course?"
    gets.chomp.to_i - 1
  end

  def ask_user_to_select_student
    puts "Which student?"
    gets.chomp.to_i - 1
  end
end
