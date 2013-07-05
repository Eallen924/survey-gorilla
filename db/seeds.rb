5.times do
  new_user = User.create(username: Faker::Name.name, password: 'password')
  3.times do
    new_survey = Survey.create(user_id: new_user.id, name: Faker::Name.first_name)
    5.times do
      new_question = Question.create(survey_id: new_survey.id, text: Faker::Company.catch_phrase)
      4.times do
          new_options = Option.create(question_id: new_question.id, text: Faker::Company.name)
        end
    end
  end
end