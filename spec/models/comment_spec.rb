require 'spec_helper'

describe Comment do
  
  describe "#user" do
  	it "should return the user who posted the comment" do
  		user = FactoryGirl.create(:user)
      comment = FactoryGirl.create(:comment, user: user)
  		comment.user.should eq user
  	end


  	it "should return user" do
  		comment = FactoryGirl.create(:comment)
  		comment.user.should_not eq nil
  	end

  end



end
