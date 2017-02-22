json.extract! frozen_dice_status, :id, :game_state_id, :total, :has_worm, :created_at, :updated_at
json.url frozen_dice_status_url(frozen_dice_status, format: :json)