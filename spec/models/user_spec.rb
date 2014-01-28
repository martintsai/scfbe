require 'spec_helper'

describe User do
  
  describe "#issues" do
  	
  	it "should return issues record" do
  		user = FactoryGirl.create(:user)
  		first_issue = FactoryGirl.create(:issue, user: user)
  		
  		user.issues.should eq [first_issue]
  	end
  end
end
