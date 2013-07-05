class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |participant|
      participant.integer :user_id
      participant.integer :survey_id
      participant.timestamps  
    end
  end
end
