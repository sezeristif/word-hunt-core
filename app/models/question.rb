class Question < ApplicationRecord
  belongs_to :correct_word, class_name: Word.name
  belongs_to :first_random_word, class_name: Word.name, optional: true
  belongs_to :second_random_word, class_name: Word.name, optional: true

  enum answer: { not_yet: 0, correct: 1, wrong: -1 }
end
