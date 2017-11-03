require 'rails_helper'

describe Favorite do
  context "when a favorite is created" do
  favorite = Favorite.create(resource_id: 3, fan_id: 4)
    it "has a resource_id" do
      expect(favorite.resource_id).to eq 3
    end
    it "has a fan_id" do
      expect(favorite.fan_id).to eq 4
    end
  end
end
