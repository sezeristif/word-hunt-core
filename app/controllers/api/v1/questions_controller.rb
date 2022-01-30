class Api::V1::QuestionsController < Api::V1::BaseController
  def create
    word = current_user.words.order('RANDOM()').first

    case params[:question_type].to_sym
    when :correction
      question = Question.create!(correct_word: word, wrong_string: generate_wrong_string(word), user: current_user)
    when :multiple_choice
      first_random_word = current_user.words.where.not(id: word.id).order('RANDOM()').first
      second_random_word = current_user.words.where.not(id: [word.id, first_random_word.id]).order('RANDOM()').first
      question = Question.create!(correct_word: word,
                                  first_random_word: first_random_word,
                                  second_random_word: second_random_word,
                                  user: current_user)
    end

    render json: question, serializer: QuestionSerializer
  end

  def check
    question = Question.find_by(id: params[:id])
    word = Word.find_by(id: params[:word_id]) if params[:word_id].present?
    word = Word.find_by(en: params[:answer_string]) if params[:answer_string].present?

    if question.correct_word == word
      question.update(answer: :correct)
    else
      question.update(answer: :wrong)
    end

    render json: question, serializer: QuestionSerializer
  end

  private

  def generate_wrong_string(word)
    word.en.split('').shuffle.join('')
  end
end
