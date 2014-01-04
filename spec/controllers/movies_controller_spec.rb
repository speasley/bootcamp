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

  describe :new do
    context "when not logged in" do
      it "should redirect you to the home page" do
        get :new
        response.should redirect_to(movies_path)
      end
    end

    context "when logged in" do
      it "should render the web page" do
        get :new, {}, user_id: '1'
        response.should be_success
      end
    end
  end
end
