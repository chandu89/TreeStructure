require 'rails_helper'

RSpec.describe TreesController, type: :controller do

  describe "#index" do
    context "when there is already data with same id" do
      it "it should return error json" do
        get :index,  params: { :tree_id=> 2 }
        expect(response.body).to eq "There is no tree with this tree id"
      end
    end
    context "searching for right id" do
      it "it should return json" do
        get :index,  params: { :tree_id=> 1 }
        res = JSON.parse(response.body)
        expect(res['id']).to eq(1)
      end
    end
  end

  describe "#child_tree" do
    context "when there is already data with other id" do
      it "it should return error json" do
        get :child_tree,  params: { :tree_id=> 2, :id => 2181 }
        expect(response.body).to eq "There is no tree with this tree id"
      end
    end
    context "when there is already data with same id" do
      it "it should return json" do
        get :child_tree,  params: { :tree_id=> 1, :id => 2181 }
        res = JSON.parse(response.body)
        expect(res).to be_a Array
      end
    end
  end

  describe "#parent_tree" do
    context "when there is already data with other id" do
      it "it should return error json" do
        get :parent_tree,  params: { :tree_id=> 2, :id => 2181 }
        expect(response.body).to eq "There is no tree with this tree id"
      end
    end
    context "when there is already data with same id" do
      it "it should return json" do
        get :parent_tree,  params: { :tree_id=> 1, :id => 2181 }
        res = JSON.parse(response.body)
        expect(res).to be_a Array
      end
    end
  end
end