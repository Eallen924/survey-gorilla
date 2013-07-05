class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |option|
      option.integer :question_id
      option.string :text

      option.timestamps
    end
  end
end
