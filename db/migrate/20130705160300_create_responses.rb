class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |response|
      response.integer :user_id
      response.integer :option_id
    end
  end
end
