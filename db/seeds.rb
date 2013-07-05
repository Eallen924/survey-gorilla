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

20.times do
  Response.create(user_id: (rand(5)+1), option_id: (rand(300)+1)) 
end

10.times do
 Participant.create(user_id: (rand(5)+1), survey_id: (rand(15)+1))
end
