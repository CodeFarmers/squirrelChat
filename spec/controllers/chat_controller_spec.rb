require 'spec_helper'
require 'awesome_print'


describe ChatController do
  describe "new" do
    it "should set the nickname to anonymous if empty" do 
      get :new
      assigns(:nickname).should_not be_blank
      assigns(:nickname).should include("Anonymous")
      ## Apparently, "Anonymous" get set as nickname in the controller action
    end
  end
end
  
