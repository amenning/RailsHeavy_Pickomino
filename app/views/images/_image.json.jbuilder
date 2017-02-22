json.extract! image, :id, :target, :filename, :filetype, :description, :theme_id, :created_at, :updated_at
json.url image_url(image, format: :json)