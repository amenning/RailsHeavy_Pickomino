json.extract! game_state, :id, :game_id, :created_at, :updated_at
json.url game_state_url(game_state, format: :json)