require "spec_helper"

describe "/movies" do
  it "can route to /movies" do
    expect({ :get => '/movies' }).to route_to(controller: 'movies', action: 'index')
  end

  it "can route to /movies/new" do
    expect({ :get => '/movies/new' }).to route_to(controller: 'movies', action: 'new')
  end
end

