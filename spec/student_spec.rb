require_relative '../entities/book'
require_relative '../entities/student'
require_relative '../entities/rental'
require 'json'

describe Student do
  before :each do
    @student = Student.new 11, 'Class 6', 17, 'Chloe', 'y'
  end
  context "When testing the Student class" do 
    it "Given title and author a Book Object must be returned" do 
      expect(@student).to be_an_instance_of Student
    end  

    it "Returns JSON after a student added" do
      expect(@student.to_json).to eql '{"json_class":"Student","id":11,"classroom":"Class 6","age":17,"name":"Chloe","parent_permission":"y"}'
    end 
  end  
end
