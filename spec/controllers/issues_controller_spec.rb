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
	
end