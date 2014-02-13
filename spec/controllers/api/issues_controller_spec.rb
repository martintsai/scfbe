require 'spec_helper'

describe Api::IssuesController do
  login_as_user

  def submit_create
    # @issue = FactoryGirl.create(:issue)
    post :create, { :issue =>
      {
        title: "sth",
        detail: "problems",
        snapshot: File.open(File.join(Rails.root, '/spec/support/images/test-image.jpg')),
      },
      format: :json
    }
  end

  describe "#create" do
    it "should create a new issue" do
      # issue = FactoryGirl.create(:issue)
      expect { submit_create }.to change(Issue, :count).by(1)
    end
  end
end
