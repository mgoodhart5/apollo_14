require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end
  describe 'Class Methods' do
    describe '.average_age' do
      it 'returns average age for all astronauts' do
        Astronaut.create(name: "astronaut_1", age: 35, job: "Captain")
        Astronaut.create(name: "astronaut_2", age: 45, job: "Engineer")

        expect(Astronaut.average_age).to eq(40)
      end
    end
  end
end
