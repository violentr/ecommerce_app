require 'spec_helper'

describe ChargesController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe 'after successful payment ' do
    it 'should be empty' do
      get "create"
      cart =Cart.create
      expect(cart.clear_it).to be_true

    end
  end
end
