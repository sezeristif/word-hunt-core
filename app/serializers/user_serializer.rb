class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :correct_question_count, :wrong_question_count, :learned_word_count

  def correct_question_count
    object.questions.where(answer: :correct).count
  end

  def wrong_question_count
    object.questions.where(answer: :wrong).count
  end

  def learned_word_count
    object.words.count
  end
end
