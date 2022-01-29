class Question < ApplicationRecord
  belongs_to :word

  enum status: { new: 0, correct: 1, wrong: -1 }
end
