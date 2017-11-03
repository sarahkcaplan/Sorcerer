module FavoritesHelper
  def find_favorite(user, resource)
    Favorite.find_by(fan_id: user.id, resource_id: resource.id)
  end


  ##can use zip and associations to create a hash that I can iterate through for finding favorites
end
