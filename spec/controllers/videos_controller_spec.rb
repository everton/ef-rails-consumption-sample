require 'spec_helper'

describe VideosController do

  describe "GET 'index'", :vcr do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end

  describe "GET 'show'", :vcr do
    it "returns http success" do
      get 'show', id: '1018728657'
      expect(response).to be_success
    end
  end

end
