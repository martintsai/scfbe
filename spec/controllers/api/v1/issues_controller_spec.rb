require 'spec_helper'

describe Api::V1::IssuesController do

	describe "#create" do
    describe "with valid authentication token" do
      it "should create issue" do
        user = FactoryGirl.create(:user)
        post :create, {
          issue: {
            title: 'test_title',
            details: 'test_details'
          },
          authentication_token: user.authentication_token
        }

       issue = assigns(:issue)
       issue.title.should eq 'test_title'
       issue.details.should eq 'test_details'
       issue.user.should eq user
      end
    end

    describe "without valid authentication token" do
      it "should return unauthorized" do
        post :create, {
          issue: {
            title: 'test_title',
            details: 'test_details'
          },
          authentication_token: 'bad_token',
          format: :json
        }
       response.code.should eq "401"
      end
    end
  end

end
