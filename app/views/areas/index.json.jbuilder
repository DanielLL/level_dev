json.array! areas.sort_by do |area|
  json.id     area.id
  json.name   area.name
  json.skills developer.current_skills(area.skills).flatten!.reverse() rescue []
end
