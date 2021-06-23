class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :test_passage, only: %i[show update result gist]

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed? || @test_passage.time_is_over?
      TestsMailer.completed_test(@test_passage).deliver_now
      if @test_passage.success?
        badge = BadgesService.new(@test_passage)
        badge.call
        flash.now[:notice] = "Получен новый бэйдж"
      end
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result; end

  def gist
    gist_service = GistQuestionService.new(@test_passage.current_question)
    result = gist_service.call
    if gist_service.success?
      url = result[:html_url]
      save_gist(url)
      flash[:success] = t('.success', gist_url: view_context.link_to(url, url, target: '_blank'))
    else
      flash[:alert] = t('.failure')
    end
    redirect_to @test_passage
  end

  def save_gist(url)
    Gist.create!(
      gist_url: url,
      question: @test_passage.current_question,
      user: current_user
      )
  rescue => e
    logger.error "Gist not saved: #{e.message}"
  end

  private

  def test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
