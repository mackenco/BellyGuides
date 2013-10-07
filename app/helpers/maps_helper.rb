require 'addressable/uri'

module MapsHelper

  def convert_address(address)
    url = Addressable::URI.new(
      scheme: "https",
      host: "maps.googleapis.com",
      path: "/maps/api/geocode/json",
      query_values: {
        address: address,
        sensor: "false"
    }).to_s

    response = JSON.parse(RestClient.get(url))
    top_result = response["results"].first
    top_result["geometry"]["location"].values_at("lat", "lng")
  end
end
