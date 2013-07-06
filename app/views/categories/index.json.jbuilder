json.array! categories.sort_by do |category|
  json.id     category.id
  json.name   category.name
  json.skills developer.current_skills(category.skills).flatten!.reverse()
end
