require_relative '../entities/teacher'
require 'json'

describe Teacher do
  before :each do
    @teacher = Teacher.new 1232, 'maths', 50, 'Thomas', 'y'
  end
  context 'When testing the Teacher class' do
    it 'Given id, specialization, age, name and parent_permission teacher object must be returned' do
      expect(@teacher).to be_an_instance_of Teacher
    end

    it 'Returns JSON after a teacher is added' do
      json_string = '{"json_class":"Teacher","id":1232,"specialization":"maths",'
      json_string.concat '"age":50,"name":"Thomas","parent_permission":"y"}'
      expect(@teacher.to_json).to eql json_string
    end
  end
end
