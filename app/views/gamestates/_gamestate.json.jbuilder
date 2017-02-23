json.extract! gamestate, :id, :game_id, :phase_id, :created_at, :updated_at
json.url gamestate_url(gamestate, format: :json)