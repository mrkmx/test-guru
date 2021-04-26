require 'octokit'

class GithubClient
  GITHUB_TOKEN = ENV['GITHUB_TOKEN']

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.create_gist(params)
    @http_client.last_response
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: GITHUB_TOKEN)
  end
end
