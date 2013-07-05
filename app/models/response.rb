class Response < ActiveRecord::Base
  belongs_to :user
  has_one :option
end
