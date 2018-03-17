json.data do
  json.todos @todos do |todo|
    json.id         todo.id
    json.title      todo.title
    json.completed  todo.completed_at.present?
    json.created_at todo.created_at&.iso8601
  end

  json.current_page @todos.current_page
  json.total_pages  @todos.total_pages
  json.per_page     @todos.limit_value
end
