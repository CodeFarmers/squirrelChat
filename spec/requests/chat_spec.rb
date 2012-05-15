require 'spec_helper'

describe "Chat" do
  describe "GET 'new_nickname'" do
    it "asks you to choose a nickname" do
      visit '/'
      page.should have_content 'Choose a nickname'
    end
    
    it "has an input field for your nickname" do
      visit '/'
      page.should have_selector :css, 'input#nickname' 
    end
    
    it "has a submit button" do
      visit '/'
      page.should have_button "Set nickname"
    end
  end
end
