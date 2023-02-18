require_relative '../nameable'
describe Nameable do
  before :each do
    @nameable = Nameable.new
  end

  context 'When testing a Nameable class' do
    it 'Given no parameters , should returns a Person object' do
      expect(@nameable).to be_an_instance_of Nameable
    end
  end

  context 'When using correct_name method' do
    it 'correct_name method should raise Not Implemented error ' do
      expect { @nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
