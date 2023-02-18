require_relative '../entities/classroom'
require_relative '../entities/student'
describe Classroom do
  describe '>> new classroom' do
    it '>> Create new classroom' do
      # Arrange
      @classroom = Classroom.new('GL-M2')

      # Act
      label = @classroom.label

      # Assert
      expect(label).to eq 'GL-M2'
    end

    it '>> Add an student' do
      # Arrange
      classroom = Classroom.new('GL-M2')
      student = Student.new('GL-M2', 'Koami', parent_permission: true, id: 10)

      # Act
      classroom.add_student(student)
      number_of_students = classroom.students.length

      # Assert
      expect(number_of_students).to eq 1
    end
  end
end
