require_relative '../trimmer_decorator'
require_relative '../entities/person'

describe TrimmerDecorator do
  before :each do
    @person = Person.new 2333, 12, 'serena tetteh', 'n'
    @trimmer_decorator = TrimmerDecorator.new @person
  end
  it 'Given one parameter, a TrimmerDecorator object is returned' do
    expect(@trimmer_decorator).to be_an_instance_of TrimmerDecorator
  end
  it 'Given a person object, correct_name method should return the person name trimmed to ten first characters' do
    expect(@trimmer_decorator.correct_name).to eql 'serena tet'
  end
end
