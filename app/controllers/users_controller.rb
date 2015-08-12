class UsersController < ApplicationController
  include UsersHelper
  before_action :reroute_unauth_user

  def show
    # byebug
    # {latitude: 39.7514438, longitude: -105.0718248}
    # render :map
  end

  def reroute_unauth_user
    redirect_to root_path unless signed_in?
  end
end
#
# <% content_for :head do %>
#   <%= javascript_include_tag 'map' %>
# <% end %>

# <div id="map"></div>
#
# <% content_for :head do %>
#   <%= javascript_include_tag 'map' %>
# <% end %>
#
# <script type="text/javascript">
#   var map;
#   function initMap() {
#     map = new google.maps.Map(document.getElementById('map'), {
#       center: {lat: 39.7514438, lng: -105.0718248},
#       zoom: 8
#     });
#   }
# </script>
