users = User.create!([
  {name: 'Matz', admin: false},
  {name: 'DHH', admin: false},
  {name: 'mrkmx', admin: true},
])

categories = Category.create!([
  {title: 'Category 1'},
  {title: 'Category 2'},
])

tests = Test.create!([
  {title: 'Test 1', level: 1, category_id: categories[0].id, author_id: users[2].id},
  {title: 'Test 2', level: 2, category_id: categories[1].id, author_id: users[2].id},
  {title: 'Test 3', level: 4, category_id: categories[1].id, author_id: users[2].id},
])

questions = Question.create!([
  {body: 'Question 1-1', test_id: tests[0].id},
  {body: 'Question 1-2', test_id: tests[0].id},
  {body: 'Question 1-3', test_id: tests[0].id},
  {body: 'Question 2-1', test_id: tests[1].id},
  {body: 'Question 2-2', test_id: tests[1].id},
  {body: 'Question 2-3', test_id: tests[1].id},
  {body: 'Question 3-1', test_id: tests[2].id},
  {body: 'Question 3-2', test_id: tests[2].id},
  {body: 'Question 3-3', test_id: tests[2].id},
])

answers = Answer.create!([
  {body: 'Answer 1', question_id: questions[0].id},
  {body: 'Answer 2', question_id: questions[1].id},
  {body: 'Answer 3', question_id: questions[2].id},
  {body: 'Answer 4', question_id: questions[3].id},
  {body: 'Answer 5', question_id: questions[4].id},
  {body: 'Answer 6', question_id: questions[5].id},
  {body: 'Answer 7', question_id: questions[6].id},
  {body: 'Answer 8', question_id: questions[7].id},
  {body: 'Answer 9', question_id: questions[8].id},
])

test_passages = TestPassage.create!([
  {user_id: users[2].id, test_id: tests[0].id},
  {user_id: users[2].id, test_id: tests[1].id},
  {user_id: users[2].id, test_id: tests[2].id},
])
