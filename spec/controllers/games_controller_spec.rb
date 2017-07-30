require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  before(:each) do
    mock_signed_in_user
    mock_games_helper
    generate_minimum_game_objects
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

    it 'freeze_dice action should accept js format' do
      call_freeze_dice_action
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq Mime::JS
    end

    # it 'freeze_dice action should assign new frozen_dice and active_dice hashes' do
    #   call_freeze_dice_action
    #   expect(response).to be_success
    #   assert_not_nil assigns(:frozen_dice)
    #   assert_not_nil assigns(:active_dice)
    # end

    it 'take_worm action should accept js format' do
      call_take_worm_action
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq Mime::JS
    end

    # it 'take_worm action should assign new grill_worms and player_worms hashes' do
    #   call_take_worm_action
    #   expect(response).to be_success
    #   assert_not_nil assigns(:grill_worms)
    #   assert_not_nil assigns(:player_worms)
    # end
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

  def mock_games_helper
    @mock_games_helper ||= double(Helpers::Games)
    mock_frozen_dice_helper
    mock_active_dice_helper
    mock_grill_worms_helper
    mock_player_options_helper
    mock_player_worms_helper
    controller.load_games_helper_service(@mock_games_helper)
  end

  def mock_frozen_dice_helper
    allow(@mock_games_helper).to receive(:frozen_dice_hash_after_freeze).and_return([])
    allow(@mock_games_helper).to receive(:frozen_dice_sum).and_return(0)
  end

  def mock_active_dice_helper
    allow(@mock_games_helper).to receive(:new_active_dice_hash).and_return([])
    allow(@mock_games_helper).to receive(:active_dice_hash_after_freeze).and_return([])
  end

  def mock_grill_worms_helper
    allow(@mock_games_helper).to receive(:grill_worms_hash).and_return([])
    allow(@mock_games_helper).to receive(:grill_worms_hash_with_all_inactive).and_return([])
  end

  def mock_player_options_helper
    allow(@mock_games_helper).to receive(:check_for_bunk_after_dice_freeze)
    allow(@mock_games_helper).to receive(:check_for_bunk_after_roll)
    allow(@mock_games_helper).to receive(:player_options_hash).and_return([])
    allow(@mock_games_helper).to receive(:update_roll_option_state)
    allow(@mock_games_helper).to receive(:check_for_game_end)
  end

  def mock_player_worms_helper
    allow(@mock_games_helper).to receive(:player_worms_hash).and_return([])
    allow(@mock_games_helper).to receive(:player_worms_hash_after_claim).and_return([])
    allow(@mock_games_helper).to receive(:sum_player_worms).and_return(0)
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
