json.array! categories.sort_by do |category|
  json.id      category.id
  json.name    category.name
  json.skills  current_developer.current_skills(category.skills).flatten!.reverse()
end
