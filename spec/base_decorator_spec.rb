require_relative '../base_decorator'
require_relative '../entities/base_decorator'

describe BaseDecorator do
  before :each do
    @person = Person.new 2333, 12, 'serena tetteh', 'n'
    @base_decorator = BaseDecorator.new @person
  end
  it 'Given a parameter a BaseDecorator object is returned' do
    expect(@base_decorator).to be_an_instance_of BaseDecorator
  end
  it 'Given a person object, correct_name method should return the person name' do
    expect(@base_decorator.correct_name).to eql 'serena tetteh'
  end
end
