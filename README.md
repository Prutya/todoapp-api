# Todo App API
A REST backend for my Todo App.

Frontend can be found [here](https://github.com/Prutya/todoapp-ui).

```
                 Prefix Verb   URI Pattern                                        Controller#Action
      api_v1_user_token POST   /api/v1/user_token(.:format)                       api/v1/user_token#create
            api_v1_user GET    /api/v1/users/:id(.:format)                        api/v1/users#show
api_v1_todo_group_todos GET    /api/v1/todo_groups/:todo_group_id/todos(.:format) api/v1/todos#index
                        POST   /api/v1/todo_groups/:todo_group_id/todos(.:format) api/v1/todos#create
            api_v1_todo PATCH  /api/v1/todos/:id(.:format)                        api/v1/todos#update
                        PUT    /api/v1/todos/:id(.:format)                        api/v1/todos#update
                        DELETE /api/v1/todos/:id(.:format)                        api/v1/todos#destroy
     api_v1_todo_groups GET    /api/v1/todo_groups(.:format)                      api/v1/todo_groups#index
```
