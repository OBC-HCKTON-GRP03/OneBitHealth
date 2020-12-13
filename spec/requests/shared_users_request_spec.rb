# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'SharedUsers', type: :request do
  describe 'GET /destroy' do
    it 'returns http success' do
      get '/shared_users/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
