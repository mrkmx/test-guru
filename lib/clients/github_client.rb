class GithubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  GITHUB_TOKEN = ENV['GITHUB_TOKEN']

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists') do |req|
      req.headers['Authorization'] = "token #{GITHUB_TOKEN}"
      req.headers['Content-Type'] = 'application/json'
      req.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end
