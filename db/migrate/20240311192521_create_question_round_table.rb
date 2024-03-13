class CreateQuestionRoundTable < ActiveRecord::Migration[7.0]
  def change
    create_table :question_rounds do |t|
      t.references :round, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
