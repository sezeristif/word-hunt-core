class AddUserIdToQuestions < ActiveRecord::Migration[6.1]
  def change
    change_table :questions do |t|
      t.references :user
    end
  end
end
