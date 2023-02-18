require'capitalize_decorator'
require_relative '../entities/person'

describe CapitalizeDecorator do
  before :each do
    @person = Person.new 2333, 12, 'serena tetteh', 'n'
    @capitalize_decorator = CapitalizeDecorator.new @person.name
  end
  it 'Given one parameter, a BaseDecorator object is returns' do
    expect(@capitalize_decorator).to be_an_instance_of CapitalizeDecorator
  end
  it 'Given a person object, correct_name method should return the person name with first character Capitalized' do
    expect(@capitalize_decorator.correct_name).to eql 'Serena tetteh'
  end
end
