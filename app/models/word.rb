class Word < ApplicationRecord
  belongs_to :user, optional: true
  has_many :questions

  enum usage: { common: 0, user: 1 }

  validates :en, uniqueness: { scope: :user_id }
  validates :tr, uniqueness: { scope: :user_id }

  before_save :update_translation
  
  private
  
  def update_translation
    if !tr.blank? && en.blank?
      self.en = TranslateService.new(tr, 'tr', 'en').translate
    elsif tr.blank? && !en.blank?
      self.tr = TranslateService.new(en, 'en', 'tr').translate
    end
  end
end
