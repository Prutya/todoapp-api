json.todoGroups @todo_groups do |todo_group|
  json.id         todo_group.id
  json.title      todo_group.title
  json.createdAt  todo_group.created_at&.iso8601
end

json.currentPage @todo_groups.current_page
json.totalPages  @todo_groups.total_pages
json.perPage     @todo_groups.limit_value
