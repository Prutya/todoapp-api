json.todo_groups @todo_groups do |todo_group|
  json.id         todo_group.id
  json.title      todo_group.title
  json.created_at todo_group.created_at&.iso8601
end

json.current_page @todo_groups.current_page
json.total_pages  @todo_groups.total_pages
json.per_page     @todo_groups.limit_value
