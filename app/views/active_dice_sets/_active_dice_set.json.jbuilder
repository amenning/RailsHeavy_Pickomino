json.extract! active_dice_set, :id, :game_state_id, :dice_id, :can_freeze, :created_at, :updated_at
json.url active_dice_set_url(active_dice_set, format: :json)