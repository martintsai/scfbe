require 'spec_helper'

describe IssuesController do
	login_as_user

	describe "#index" do

		it "should be success" do
			get :index
			response.code.should eq "200"
		end

		it "should assign @issues" do
			issue = FactoryGirl.create(:issue)
			get :index
			assigns(:issues).should eq [issue]
		end

    it "should assign @recent_issues" do
      issue1 = FactoryGirl.create(:issue)
      issue2 = FactoryGirl.create(:issue)
      get :index
      assigns(:recent_issues).should eq [issue2, issue1]
    end
	end

  describe "#show" do
    it "should assign @issue" do
      issue = FactoryGirl.create(:issue)
      get :show, {:id => issue.to_param}
      assigns(:issue).should eq issue
    end
  end

  describe "#new" do
    it "should assign @issue" do
      get :new
      assigns(:issue).should_not be_nil
    end
  end

  describe "#create" do
    it "should assign @issue with params provided" do
      post :create, {issue: {title: 'test_title', details: 'test_details'}}
      issue = assigns(:issue)

      issue.title.should eq 'test_title'
      issue.details.should eq 'test_details'
    end

    it "should assign @issue to current user" do
      post :create, {issue: {title: 'test_title', details: 'test_details'}}
      issue = assigns(:issue)
      issue.user.should eq @user
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