# takes the todo_item object, and extracts the given data from the object
json.extract! todo_item, :id, :title, :property_unit_id, :complete, :created_at, :updated_at
