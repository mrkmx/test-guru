users = [
  {name: 'Matz', admin: false},
  {name: 'DHH', admin: false},
  {name: 'mrkmx', admin: true},
]

answers = [
  {body: 'Answer 1', question_id: 1},
  {body: 'Answer 2', question_id: 2},
  {body: 'Answer 3', question_id: 3},
  {body: 'Answer 4', question_id: 4},
  {body: 'Answer 5', question_id: 5},
  {body: 'Answer 6', question_id: 6},
  {body: 'Answer 7', question_id: 7},
  {body: 'Answer 8', question_id: 8},
  {body: 'Answer 9', question_id: 9},
]

categories = [
  {title: 'Category 1'},
  {title: 'Category 2'},
]

questions = [
  {body: 'Question 1-1', test_id: 1},
  {body: 'Question 1-2', test_id: 1},
  {body: 'Question 1-3', test_id: 1},
  {body: 'Question 2-1', test_id: 2},
  {body: 'Question 2-2', test_id: 2},
  {body: 'Question 2-3', test_id: 2},
  {body: 'Question 3-1', test_id: 3},
  {body: 'Question 3-2', test_id: 3},
  {body: 'Question 3-3', test_id: 3},
]

tests = [
  {title: 'Test 1', level: 0, category_id: 1},
  {title: 'Test 2', level: 1, category_id: 2},
  {title: 'Test 3', level: 2, category_id: 2},
]

results = [
  {user_id: 1, test_id: 1},
  {user_id: 1, test_id: 2},
]

User.create!(users) if Rails.env.development?
Category.create!(categories)
Test.create!(tests)
Question.create!(questions)
Answer.create!(answers)
Result.create!(results)
