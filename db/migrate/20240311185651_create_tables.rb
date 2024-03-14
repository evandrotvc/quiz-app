class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :players do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :rounds do |t|
      t.belongs_to :player, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end

    create_table :questions do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.string :description, null: false
      t.timestamps
    end

    create_table :options do |t|
      t.belongs_to :question, null: false, foreign_key: true
      t.string :label, null: false
      t.boolean :correct, default: false
      t.timestamps
    end

    create_table :answers do |t|
      t.belongs_to :round, null: false, foreign_key: true
      t.belongs_to :question, null: true, foreign_key: true
      t.belongs_to :option, null: true, foreign_key: true
      t.timestamps
    end

  end
end
