class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :test_passage, only: %i[show update result gist]

  HTTP_CREATED_STATUS = 201

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result; end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call
    flash_options = if result.status == HTTP_CREATED_STATUS
      url = result.data.html_url
      { success: t('.success', gist_url: view_context.link_to(url, url, target: '_blank')) }
    else
      { alert: t('.failure') }
    end
    redirect_to @test_passage, flash_options
  end

  private

  def test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
