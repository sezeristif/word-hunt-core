class QuestionSerializer < ActiveModel::Serializer
  belongs_to :correct_word, serializer: WordSerializer
  belongs_to :first_random_word, serializer: WordSerializer
  belongs_to :second_random_word, serializer: WordSerializer

  attributes :id, :wrong_string, :answer
end
