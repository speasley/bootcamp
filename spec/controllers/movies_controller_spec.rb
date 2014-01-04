require "spec_helper"

describe MoviesController do
  describe :index do
    let!(:movie)  { Movie.create(:title => "blah") }

    before :each do
      get :index
    end

    it "loads all movies" do
      assigns(:movies).should_not be_nil
      assigns(:movies).should include(movie)
    end

    it "returns a webpage" do
      response.should be_success
    end
  end
end
