class GistQuestionService
  GITHUB_TOKEN = ENV['GITHUB_TOKEN']
  HTTP_CREATED_STATUS = 201

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || default_client
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == HTTP_CREATED_STATUS
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', test_title: @test.title),
      public: true,
      files: {
        "test_guru_question.txt": {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: GITHUB_TOKEN)
  end
end
