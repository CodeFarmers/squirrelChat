require 'spec_helper'

describe "Chat" do
  subject { page }
  describe "choosing a nickname" do
    before { visit root_path }
    it { should have_selector('h3', text: 'Choose a nickname') }
    it { should have_selector('input', type: text, id: 'user_nickname') }
    it { should have_selector('input', type: 'submit', value: 'Set nickname') }
    
    it "should set the nickname to the chosen name" do
      fill_in "user_nickname", :with => "TheKingsWhore"
      click_button "Set nickname"
      page.should have_selector('p.navbar-text', text: 'TheKingsWhore')
    end
    
    it "should set 'Anonymous' when the text box is left blank" do
      click_button "Set nickname"
      page.should have_selector('p.navbar-text', text: 'Anonymous')
    end  
  end
end