json.projects do
  json.array!(@projects) do |project|
    json.name project.name
    json.url project_path(project)
  end
end

json.items do
  json.array!(@items) do |item|
    json.name item.title
    # json.url project_item_path(item)
  end
end
