require 'rails_helper'

RSpec.describe 'Projects', type: :request do
  let!(:projects) { create_list(:project, 20) }

  describe 'GET projects' do
    it 'should retrieve all projects' do
      get projects_path
      json_response = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json_response['data'].length).to eq(20)
    end
  end
end
