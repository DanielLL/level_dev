json.array! categories.sort_by do |category|
  json.id     category.id
  json.name   category.name
  json.skills category.skills.sort_by &:id
end
