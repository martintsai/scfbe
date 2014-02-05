require 'spec_helper'

describe IssuesController do 
	login_as_user
	
	describe "#index" do 
		
		it "should be success" do 
			get "index"
			response.code.should eq "200"
		end

		it "should assign @issues" do
			issue = FactoryGirl.create(:issue)
			get "index"
			assigns(:issues).should eq [issue]
		end

	end

	describe "#update" do
		it "updates the requested issue" do
        issue = FactoryGirl.create(:issue)
        Issue.any_instance.should_receive(:update)

        put :update, {:id => issue.to_param, issue: {title: "New Title"}}

        issue.reload
        assigns(:issue).should eq(issue)
        # issue.title.should eq "New Title"
     end
	end
	
end