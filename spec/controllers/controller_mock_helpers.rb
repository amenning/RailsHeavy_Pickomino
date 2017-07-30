module ControllerMockHelpers
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
end
