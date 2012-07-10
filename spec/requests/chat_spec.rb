require 'spec_helper'

describe "Chat" do
  subject { page }
  describe "choosing a nickname" do
    before { visit root_path }
    it { should have_selector('h3', text: 'Choose a nickname') }
    it { should have_selector('input', type: text, id: 'user_nickname') }
    it { should have_selector('input', type: 'submit', value: 'Set nickname') }
    
    #it "should set the nickname to the chosen name" do
    #  fill_in "user_nickname", :with => "TheKingsWhore"
    #  click_button "Set nickname"
    #  page.should have_selector('p.navbar-text', text: 'TheKingsWhore')
    #end

    describe "set the nickname to the chosen name" do
      it "if the nickname does not exist" do
        fill_in "user_nickname", :with => "TheKingsWhore"
        click_button "Set nickname"
        page.should have_selector('p.navbar-text', text: 'TheKingsWhore')
      end
      it "if the nickname exists" do
        user = User.create(nickname: "Tom")
        fill_in "user_nickname", :with => "Tom"
        click_button "Set nickname"
        page.should have_selector('p.navbar-text', text: 'Tom')
      end
    end
    
    it "should set 'Anonymous' when the text box is left blank" do
      click_button "Set nickname"
      page.should have_selector('p.navbar-text', text: 'Anonymous')
    end
  end

  describe "chatting" do
    before do
      visit root_path
      fill_in "user_nickname", :with => "TheKingsWhore"
      @user = User.create(nickname: "Tom")
      @user2 = User.create(nickname: "Nick")
      FactoryGirl.create(:post, user: @user)
      FactoryGirl.create(:post, user: @user2)
      click_button "Set nickname"
    end

    it "should show the existing posts" do
      page.should have_selector('div#chatbox', text: "Tom says: Just some content")
      page.should have_selector('div#chatbox', text: "Nick says: Just some content")
    end

    it "should show a newly submitted post" do
      fill_in "post_content", with: "A new post"
      click_button "Send"
      page.should have_selector('div#chatbox', text: "TheKingsWhore says: A new post")
    end
  end
end