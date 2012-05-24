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
    
    it "can set a nickname" do
      visit '/'
      fill_in "nickname", :with => "HomoYannick"
      click_button "Set nickname"
      page.should have_content('Your nickname: "HomoYannick"')
    end
    
    it "should set the nickname to 'Anonymous' if the nickname field is left empty" do
        # TODO: Fix this bug
    end
  end
end
