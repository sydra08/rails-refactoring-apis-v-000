class RepositoriesController < ApplicationController
  def index
    # need to pass in the token so that it properly authenticates
    github = GithubService.new({'access_token' => session[:token]})
    @repos_array = github.get_repos
  end

  def create
    github = GithubService.new({'access_token' => session[:token]})
    github.create_repo(params[:name])

    redirect_to '/'
  end
end
