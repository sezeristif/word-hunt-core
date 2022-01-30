class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.references :correct_word, index: true, foreign_key: { to_table: :words }
      t.references :first_random_word, index: true, foreign_key: { to_table: :words }
      t.references :second_random_word, index: true, foreign_key: { to_table: :words }
      t.string :wrong_string
      t.integer :answer, default: 0

      t.timestamps
    end
  end
end
