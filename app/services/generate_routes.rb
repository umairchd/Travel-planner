class GenerateRoutes
  def self.routes_generator(user)
    begin
      origin = user.locations.home.first
      destination = user.locations.work.first
      response = HTTP.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{origin.latitude},#{origin.longitude}&destination=#{destination.latitude},#{destination.longitude}&key=#{ENV['SERVICE_URL']}&alternatives=true")
      routes = JSON.parse(response.body)['routes']
      routes.each do |route|
        user.routes.create(route_params(route, user))
      end
      OpenStruct.new(success: true)
    rescue Net::ReadTimeout
      OpenStruct.new(success: false)
    rescue StandardError
      OpenStruct.new(success: false)
    end
  end

  private

  def self.route_params route, user
    data = route['legs'][0]
    steps = data['steps'][0]
    {
      origin: data['start_address'],
      destination: data['end_address'],
      summary: route['summary'],
      duration: data['duration']['text'],
      travel_mode: steps['travel_mode'],
      distance: data['distance']['text'],
      trace: route['overview_polyline']['points'],
      user_id: user.id
    }
  end
end
