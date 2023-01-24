require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET posts#index' do
    before(:each) { get "/users/1/posts" }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template("index")
    end

    it 'includes placeholder text' do
      expect(response.body).to include('<h1>SHOW POSTS OF ONE USER</h1>')
    end
  end

  describe 'GET posts#show' do
    before(:each) { get "/users/1/posts/1" }

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template("show")
    end

    it 'includes placeholder text' do
      expect(response.body).to include('<h1>SHOW POST AND COMMENTS</h1>')
    end
  end
end