require_relative './entities/student'
require_relative './entities/teacher'
require_relative './entities/book'
require_relative './entities/rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    puts 'Welcome to School library App!'
  end

  def run
    display_menu
  end

  def display_menu
    puts "\nPlease choose an option by entering the number:
            1- List all books
            2- List all people
            3- Create a person
            4- Create a book
            5- Create a rental
            6- List all rentals for a given person id
            7- Exit"
    user_input = gets.chomp
    process_input(user_input)
  end

  def process_input(input)
    case input
    when '1'
      find_books
    when '2'
      find_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      find_rentals
    when '7'
      exit
    else
      display_menu
    end
  end

  def find_books
    if @books.empty?
      puts 'No added book!'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
    display_menu
  end

  def find_people
    if @people.empty?
      puts 'No added person!'
    else
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  display_menu
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    print 'Classroom: '
    classroom = gets.chomp
    @people.push(Student.new(classroom, age, name: name, parent_permission: parent_permission))
    puts
    puts 'Person created successfuly'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people.push(Teacher.new(specialization, age, name: name))
    puts
    puts 'Person created successfuly'
  end

  def create_person
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]'
    person = gets.chomp
    case person
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please add either 1 or 2!'
    end

    display_menu
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'Book created successfully'
    display_menu
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: '#{book.title}', Author: #{book.author}" }
    book_number = gets.chomp.to_i
    puts

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_number = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp
    @rentals.push(Rental.new(date, @books[book_number], @people[person_number]))
    puts 'Rental created successfully'

    display_menu
  end

  def find_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
    display_menu
  end

  def exit
    puts 'Thank you for using the app!'
  end
end
