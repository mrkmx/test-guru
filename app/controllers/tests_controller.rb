class TestsController < ApplicationController
  before_action :test, only: %i[show destroy edit update]
  before_action :all_tests, only: %i[index]
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
  def index; end
  
  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
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

  # def record_not_found
  #   render plain: "404 Not Found", status: 404
  # end
end
