require 'rails_helper'

RSpec.describe EstablishmentsController, :type => :controller do
  
  describe "GET #index" do
    it "sets the @establishments variable" do
      beer = Establishment.create(name: "Beers")
      ipa = Establishment.create(name: "IPA")

      get :index
      expect(assigns(:establishments)).to match_array([beer, ipa])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

  end

 
end