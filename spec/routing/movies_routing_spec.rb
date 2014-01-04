require "spec_helper"

describe "/movies" do
  it "can route to /movies" do
    expect({ :get => '/movies' }).to route_to(controller: 'movies', action: 'index')
  end
end

