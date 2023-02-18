require_relative '../nameable'

describe Nameable do
  before :each do
    @nameable = Nameable.new
  end
  it 'Given no parameters , should returns a Person object' do
    expect(@nameable).to be_an_instance_of Nameable
  end
  it 'correct_name method should raise Not Implemented error ' do
    expect { @nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
