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

		describe "#validates" do
			
			context "when the title is empty" do
				it "should be invalid" do
					issue = Issue.new(title: "")
					issue.should_not be_valid
				end
			end

			context "when title is provided" do 
				it "should be valid" do
					issue = Issue.new(title: "Problem Title")
					issue.should be_valid 
				end
			end
		
		end
	
end