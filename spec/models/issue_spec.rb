require 'spec_helper'

	describe Issue do 

		describe "#user" do
			
			it "should return the user who posted the issue" do
				user = FactoryGirl.create(:user)
				issue = FactoryGirl.create(:issue, user: user)
				issue.user.should eq user
			end

			it "should return user" do
				issue = FactoryGirl.create(:issue)
				issue.user.should_not eq nil
			end

		end

		
end