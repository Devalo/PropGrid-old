# takes a list of Todo items and pass each oone into the partial, which
# will pick it apart. 
json.array! @todo_item, partial: "/api/v1/todo_items/todo_item", as: :todo_item
