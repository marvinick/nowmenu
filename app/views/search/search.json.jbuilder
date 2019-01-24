json.projects do
  json.array!(@projects) do |project|
    json.name project.name
    json.url project_path(project)
  end
end
