require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET users#index' do
    before(:each) { get "/users" }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template("index")
    end

    it 'includes placeholder text' do
      expect(response.body).to include('<h1>SHOW USERS</h1>')
    end
  end

  describe 'GET users#show' do
    before(:each) { get "/users/1" }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template("show")
    end

    it 'includes placeholder text' do
      expect(response.body).to include('<h1>SHOW INFO OF ONE USER</h1>')
    end
  end
end