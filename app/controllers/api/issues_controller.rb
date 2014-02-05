class Api::IssuesController < ApplicationController
  protect_from_forgery with: :null_session

  respond_to :json

  # POST /api/issues
  # POST /api/issues.json
  def create
    @issue = Issue.new(issue_params)

    if @issue.save
      render nothing: true, status: :created
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:title, :details, :snapshot)
    end

end
