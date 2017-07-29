require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  before(:each) do
    # Need to load constants stored in DB for post signin redirect
    load Rails.root + 'db/seeds.rb'
    user = double('user')
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
  end

  context 'when given valid frozen_dice_set' do
    it 'should return a success' do
      #visit play_games_path
      #expect(page).to have_http_status(200)

      get :play
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  private

  def signin(email, password)
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end
