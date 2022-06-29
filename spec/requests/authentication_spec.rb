require 'rails_helper'

RSpec.describe "Authentication", type: :request do

  describe "POST /login" do
    subject { create :user }

    it 'should log in succesfully' do
      post login_path, params: { username: subject.username, password: subject.password }
      
      expect(response.status).to eq(200)
    end

    it 'should not log in if parameters are not right' do
      post login_path, params: { username: subject.username, password: 'Not remotely correct' }
      
      expect(response.status).to eq(401)
    end
  end
end
