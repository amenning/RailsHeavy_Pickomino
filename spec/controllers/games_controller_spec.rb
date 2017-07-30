require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  before(:each) do
    # Need to load constants stored in DB for post signin redirect
    load Rails.root + 'db/seeds.rb'
    user = double('user')
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
  end

  context 'actions should respond to expected format type' do
    it 'play action should accept html format' do
      get :play, 'Accept' => Mime::HTML
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq Mime::HTML
    end

    # it 'play action should assign new grill worms and active dice' do
    #   get :play
    #   assert_response :success
    #   assert_not_nil assigns(:grill_worms)
    #   assert_not_nil assigns(:active_dice)
    #   assert_equal({}, assigns(:frozen_dice))
    #   assert_equal({}, assigns(:player_worms))
    # end

    it 'roll action should accept js format' do
      PlayerOption.create(can_roll: 1)
      FactoryGirl.build(:worm)
      FactoryGirl.build(:dice)
      FactoryGirl.build(:frozen_dice)
      call_roll_action
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq Mime::JS
    end

    # it 'roll action should assign new active_dice hash' do
    #   call_roll_action
    #   expect(response).to be_success
    #   assert_not_nil assigns(:active_dice)
    # end
    #
    # it 'freeze_dice action should accept js format' do
    #   call_freeze_dice_action
    #   expect(response).to be_success
    #   expect(response).to have_http_status(200)
    #   expect(response.content_type).to eq Mime::JS
    # end
    #
    # it 'freeze_dice action should assign new frozen_dice and active_dice hashes' do
    #   call_freeze_dice_action
    #   expect(response).to be_success
    #   assert_not_nil assigns(:frozen_dice)
    #   assert_not_nil assigns(:active_dice)
    # end
    #
    # it 'take_worm action should accept js format' do
    #   call_take_worm_action
    #   expect(response).to be_success
    #   expect(response).to have_http_status(200)
    #   expect(response.content_type).to eq Mime::JS
    # end
    #
    # it 'take_worm action should assign new grill_worms and player_worms hashes' do
    #   call_take_worm_action
    #   expect(response).to be_success
    #   assert_not_nil assigns(:grill_worms)
    #   assert_not_nil assigns(:player_worms)
    # end
  end

  private

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
