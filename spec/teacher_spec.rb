
require_relative '../entities/teacher'
require 'json'

describe Teacher do
  before :each do
    @teacher = Teacher.new 1232, 'maths', 50, 'Thomas', 'y'
  end
  context "When testing the Teacher class" do 
    it "Given id, specialization, age, name and parent_permission teacher object must be returned" do 
      expect(@teacher).to be_an_instance_of Teacher
    end  

    it "Returns JSON after a teacher is added" do
      expect(@teacher.to_json).to eql '{"json_class":"Teacher","id":1232,"specialization":"maths","age":50,"name":"Thomas","parent_permission":"y"}'
    end 
  end  
end