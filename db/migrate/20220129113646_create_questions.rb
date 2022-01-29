class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.references :word
      t.integer :status, default: 0
      t.string :answer

      t.timestamps
    end
  end
end
