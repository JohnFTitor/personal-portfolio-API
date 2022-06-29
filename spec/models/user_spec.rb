require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject { build :user }

  describe 'Validations' do
    it 'should have a username' do
      subject.username = nil
      
      expect(subject).to_not be_valid
    end

    it 'should have an email' do
      subject.email = nil
      
      expect(subject).to_not be_valid
    end

    it 'should have a password' do
      subject.password_digest = nil
      
      expect(subject).to_not be_valid
    end
  end
end
