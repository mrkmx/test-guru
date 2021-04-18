class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :test, only: %i[start]
  before_action :all_tests, only: %i[index]

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def test
    @test = Test.find(params[:id])
  end

  def all_tests
    @tests = Test.all
  end
end
