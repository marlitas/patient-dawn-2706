class TeamsController < ApplicationController
  def new

  end

  def create
    competition = Competition.find(params[:competition_id])
    team = Team.create!(team_params)
    competition.teams << team

    redirect_to "/competitions/#{competition.id}"
  end

  def team_params
    params.permit(:nickname, :hometown)
  end
end
