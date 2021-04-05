class TestsController < ApplicationController
  before_action :test, only: %i[show destroy edit update start]
  before_action :all_tests, only: %i[index]
  before_action :user, only: %i[start]

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

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
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

  def user
    @user = User.first
  end
end
