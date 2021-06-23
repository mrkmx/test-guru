class BadgesService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
  end

  def call
    Badge.all.each do |badge|
      reward(badge) if send(badge.rule) # тут как-то можно проверить, что передаваемый в send() метод существует?
    end
  end

  def reward(badge)
    @user.badges << badge
  end

  def rule_all_in_category
    return if @user.badges.where(rule: :rule_all_in_category).count > 0

    passed_tests_ids = @user.test_passages.where(passed: true).pluck(:test_id).uniq
    all_tests_by_category_id = Test.by_category_id(@test.category_id).pluck(:id)
    result = all_tests_by_category_id - passed_tests_ids
    result.empty?
  end

  def rule_first_try
    test_passages = @user.test_passages.where(test_id: @test.id)
    return if test_passages.count > 1

    test_passages.first.passed
  end

  def rule_all_by_level
    return if @user.badges.where(rule: :rule_all_by_level).count > 0

    passed_tests_ids = @user.test_passages.where(passed: true).pluck(:test_id).uniq
    all_tests_by_level = Test.by_level(@test.level).pluck(:id)
    result = all_tests_by_level - passed_tests_ids
    result.empty?
  end
end
