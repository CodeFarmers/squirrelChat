require 'spec_helper'

describe PostsController do

  let(:user) { FactoryGirl.create(:user) }

  describe "creating a post with Ajax" do

    before do
      session[:user_id] = user.id
    end

    it "should increment the Post count" do
      expect do
        xhr :post, :create, post: { content: "This is content" }
      end.should change(Post, :count).by(1)
    end

    it "should respond with success" do
      xhr :post, :create, post: { content: "Also some content" }
      response.should be_success
    end
  end
end