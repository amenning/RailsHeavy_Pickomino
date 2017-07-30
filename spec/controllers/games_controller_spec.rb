require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  before(:each) do
    mock_signed_in_user
    mock_games_helper
    generate_minimum_game_objects
  end

  context 'play action' do
    it 'should accept html format' do
      call_play_action
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq Mime::HTML
    end

    it 'should assign new grill worms and active dice' do
      call_play_action
      expect(assigns(:grill_worms)).not_to be_nil
      expect(assigns(:active_dice)).not_to be_nil
      expect(assigns(:frozen_dice)).to be_empty
      expect(assigns(:player_worms)).to be_empty
    end
  end

  context 'roll action' do
    it 'should accept js format' do
      call_roll_action
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq Mime::JS
    end

    it 'should assign new active_dice hash' do
      call_roll_action
      expect(assigns(:active_dice)).not_to be_nil
    end
  end

  context 'freeze_dice action' do
    it 'should accept js format' do
      call_freeze_dice_action
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq Mime::JS
    end

    it 'should assign new frozen_dice and active_dice hashes' do
      call_freeze_dice_action
      expect(assigns(:active_dice)).not_to be_nil
      expect(assigns(:frozen_dice)).not_to be_nil
    end
  end

  context 'take_worm action' do
    it 'should accept js format' do
      call_take_worm_action
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq Mime::JS
    end

    it 'should assign new grill_worms and player_worms hashes' do
      call_take_worm_action
      expect(assigns(:grill_worms)).not_to be_nil
      expect(assigns(:player_worms)).not_to be_nil
    end
  end

  private

  def mock_signed_in_user
    user = double('user')
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
  end

  def generate_minimum_game_objects
    PlayerOption.create(can_roll: 1)
    FrozenDiceStatus.create(has_worm: 1, total: 30)
    PlayerWormSet.create
    FactoryGirl.build(:frozen_dice)
  end

  def call_play_action
    get :play, 'Accept' => Mime::HTML
  end

  def call_roll_action
    xhr :get, :roll, format: 'js', 'Accept' => Mime::JS, remote: true
  end

  def call_freeze_dice_action
    xhr :post, :freeze_dice, dice: { value: 3 }, format: 'js', 'Accept' => Mime::JS, remote: true
  end

  def call_take_worm_action
    xhr :post, :take_worm, worm: { value: 3 }, format: 'js', 'Accept' => Mime::JS, remote: true
  end
end
