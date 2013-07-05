class Option < ActiveRecord::Base
  belongs_to :question
  has_one :response
  validates :text, presence: true

  def newline_options
    options.map({|o| o.text}.join("\n")
  end
end
