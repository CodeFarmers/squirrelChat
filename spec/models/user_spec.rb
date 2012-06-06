require 'spec_helper'

describe User do
  
  before { @user = User.new(nickname: "Tyrion") }
  
  subject { @user }

  it { should respond_to(:nickname) }
  it { should respond_to(:posts) }
  
  it { should be_valid }
  
  describe "when nickname is not present" do
    before { @user.nickname = " " }
    it { should_not be_valid }
  end
  
  describe "when nickname is too long" do
    before { @user.nickname = "a" * 51 }
    it { should_not be_valid }
  end  
end
