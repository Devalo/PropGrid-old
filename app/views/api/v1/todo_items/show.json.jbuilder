# renders the todo_item partial, and sets @todo_item as an argument.
json.partial! "api/v1/todo_items/todo_item", todo_item: @todo_item
