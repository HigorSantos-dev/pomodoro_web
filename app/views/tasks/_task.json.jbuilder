json.extract! task, :id, :titulo, :descricao, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
