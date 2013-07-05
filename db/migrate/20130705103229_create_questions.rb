class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |question|
      question.integer :survey_id
      question.string :type
      question.string :text
      
      question.timestamps
    end
  end
end
