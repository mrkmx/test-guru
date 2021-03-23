class TestsController < ApplicationController
  before_action :test, only: %i[show destroy]
  before_action :all_tests, only: %i[index]
  
  def index; end
  
  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to tests_path
    else
      render plain: @test.errors.messages
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
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
