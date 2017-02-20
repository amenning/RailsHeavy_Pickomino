json.extract! image, :id, :filename, :filetype, :description, :created_at, :updated_at
json.url image_url(image, format: :json)