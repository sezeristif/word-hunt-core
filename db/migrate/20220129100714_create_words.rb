class CreateWords < ActiveRecord::Migration[6.1]
  def change
    create_table :words do |t|
      t.string :en
      t.string :tr
      t.references :user
      t.integer :usage, default: 0
      t.timestamps
    end
  end
end
