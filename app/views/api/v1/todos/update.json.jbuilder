json.todo do
  json.id         @todo.id
  json.title      @todo.title
  json.completed  @todo.completed_at.present?
  json.created_at @todo.created_at&.iso8601
end
