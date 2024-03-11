class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end

    create_table :players do |t|
      t.string :name
      t.timestamps
    end

    create_table :rounds do |t|
      t.belongs_to :player, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.integer :total_questions, default: 0
      t.integer :total_correct_answers, default: 0
      t.integer :total_answered_questions, default: 0

      t.timestamps
    end

    create_table :questions do |t|
      t.string :description
      t.timestamps
    end

    create_table :options do |t|
      t.belongs_to :question, null: false, foreign_key: true
      t.string :label
      t.timestamps
    end

    create_table :answers do |t|
      t.belongs_to :question, null: false, foreign_key: true
      t.belongs_to :option, null: false, foreign_key: true
      t.boolean :correct
      t.timestamps
    end

  end
end
