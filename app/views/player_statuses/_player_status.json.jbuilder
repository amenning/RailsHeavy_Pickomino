json.extract! player_status, :id, :game_state_id, :player_id, :score, :created_at, :updated_at
json.url player_status_url(player_status, format: :json)