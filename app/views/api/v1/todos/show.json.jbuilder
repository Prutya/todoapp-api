json.todo do
  json.id          @todo.id
  json.todoGroupId @todo.todo_group_id
  json.title       @todo.title
  json.completed   @todo.completed_at.present?
  json.createdAt   @todo.created_at&.iso8601
end
