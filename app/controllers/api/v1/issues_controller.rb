class Api::V1::IssuesController < Api::V1::BaseController

  # POST /api/issues
  # POST /api/issues.json
  def create
    @issue = Issue.new(issue_params)
    @issue.user_id = current_user.id

    if @issue.save
      render json: @issue, status: :created
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
