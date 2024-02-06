class Router
  def initialize(courses_controller, students_controller)
    @courses_controller = courses_controller
    @students_controller = students_controller
  end

  def run
    loop do
      print_actions
      action = gets.chomp.to_i
      dispatch(action)
    end
  end

  private

  def print_actions
    puts "\n---"
    puts 'What do you want to do?'
    puts '1 - Display students'
    puts '2 - Add a new student'
    puts '3 - Add a student to a course'
    puts '4 - Remove a student'
    puts '5 - List courses'
    puts '6 - Add a new course'
    puts '7 - Remove a course'
    puts '8 - Exit'
    puts '---'
  end

  def dispatch(action)
    case action
    when 1 then @students_controller.list
    when 2 then @students_controller.add
    when 3 then @courses_controller.add_student_to_course
    when 4 then @students_controller.remove_student
    when 5 then @courses_controller.list
    when 6 then @courses_controller.add
    when 7 then @courses_controller.remove
    when 8 then exit
    else
      puts "Please type a number from 1 to 8 :)"
    end
  end
end
