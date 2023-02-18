require_relative '../Decorate/base_decorator'
require_relative '../Decorate/capitalize_decorator'
require_relative '../Decorate/nameable'
require_relative '../Decorate/trimmer_decorator'
require_relative '../entities/person'

describe Nameable do
  before :each do
    @nameable = Nameable.new
  end

  context 'When testing a Nameable class' do
    it 'should be an instance of Nameable object' do
      expect(@nameable).to be_an_instance_of Nameable
    end
  end

  context 'When using correct_name method' do
    it 'should raise an error' do
      expect { @nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end

describe BaseDecorator do
  before :each do
    @person = Person.new(15,26, 'KoamiNogbedji')
    @base_decorator = BaseDecorator.new(@person)
  end

  context 'When testing a BaseDecorator class' do
    it 'should be an instance of BaseDecorator object' do
      expect(@base_decorator).to be_an_instance_of BaseDecorator
    end
  end

  context 'When using correct_name method' do
    it 'should return the correct name' do
      expect(@base_decorator.correct_name).to eql 'KoamiNogbedji'
    end
  end
end

describe CapitalizeDecorator do
  before :each do
    @person = Person.new(12,26, 'KoamiNogbedji')
    @capitalize = CapitalizeDecorator.new(@person)
  end

  context 'When testing a CapitalizeDecorator class' do
    it 'should be an instance of CapitalizeDecorator object' do
      expect(@capitalize).to be_an_instance_of CapitalizeDecorator
    end
  end

  context 'When using correct_name method' do
    it 'should return the capitalized name' do
      expect(@capitalize.correct_name).to eql 'Koaminogbedji'
    end
  end
end

describe TrimmerDecorator do
  before :each do
    @person = Person.new(12,26, 'KoamiNogbedji')
    @trimmer = TrimmerDecorator.new(@person)
  end

  context 'When testing a TrimmerDecorator class' do
    it 'should be an instance of TrimmerDecorator object' do
      expect(@trimmer).to be_an_instance_of TrimmerDecorator
    end
  end

  context 'When using correct_name method' do
    it 'should return the the name upto 10 characters' do
      expect(@trimmer.correct_name).to eql 'KoamiNogbe'
    end
  end
end
