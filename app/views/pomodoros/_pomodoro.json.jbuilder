json.extract! pomodoro, :id, :task_id, :duracao, :concluido, :inicio_task, :fim_task, :created_at, :updated_at
json.url pomodoro_url(pomodoro, format: :json)
