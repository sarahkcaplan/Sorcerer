def find_favorite(user, resource)
  Favorite.find_by(fan_id: user.id, resource_id: resource.id)
end
