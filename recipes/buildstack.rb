# Docker build stack
if node['dokku']['buildstack']['use_prebuilt']
  docker_image node['dokku']['buildstack']['image_name'] do
    source node['dokku']['buildstack']['prebuilt_url']
    cmd_timeout 600
    action :import
  end
else
  docker_image node['dokku']['buildstack']['image_name'] do
    source node['dokku']['buildstack']['stack_url']
    cmd_timeout 600
    action :build
  end
end

# TODO: Custom buildpacks (?)
