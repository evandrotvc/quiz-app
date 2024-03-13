# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

def create_options_questions_math(question, index)
    if index == 0
      [{ label: '1' }, { label: '2' }, { label: '3' },
       { label: '4', correct: true }].each do |option|
        Option.create!(option.merge(question: question ))
      end
    elsif index == 1
      [{ label: '1' }, { label: '2' }, { label: '3', correct: true },
       { label: '4' }].each do |option|
        Option.create!(option.merge(question: question ))
      end
    elsif index == 2
      [{ label: '1' }, { label: '2' }, { label: '16', correct: true },
       { label: '4' }].each do |option|
        Option.create!(option.merge(question: question ))
      end
    elsif index == 3
      [{ label: '1' }, { label: '2' }, { label: '16' },
       { label: '25', correct: true }].each do |option|
        Option.create!(option.merge(question: question ))
      end
    end
end

def create_options_questions_portuguese(question, index)
    if index == 0
      [{ label: 'sujeito' }, { label: 'qualidade' }, { label: 'ação' },
       { label: 'acento', correct: true }].each do |option|
        Option.create!(option.merge(question: question ))
      end
    elsif index == 1
      [{ label: 'ação', correct: true }, { label: 'qualidade' }, { label: 'sujeito' },
       { label: 'objeto' }].each do |option|
        Option.create!(option.merge(question: question ))
      end
    elsif index == 2
      [{ label: 'sujeito', correct: true }, { label: 'qualidade' }, { label: 'ação' },
       { label: 'objeto' }].each do |option|
        Option.create!(option.merge(question: question ))
      end
    elsif index == 3
      [{ label: 'ação' }, { label: 'substantivo' }, { label: 'objeto' },
       { label: 'qualidade', correct: true }].each do |option|
        Option.create!(option.merge(question: question ))
      end
    end
end

%w[portuguese mathematics].each do |category|
  new_category = Category.find_by(name: category)

  if new_category
    puts "Category: #{category} já existe."
  else
    new_category = Category.create(name: category)
    puts "Category: #{category} criada com sucesso!"
  end
end

# questions mathematic

['Quanto é 1+1?', 'Quanto é raiz quadrada de 9', 'Quanto é 4*4?','Quanto é 5*5?'].each_with_index do |question, index|
  category = Category.find_by(name: 'mathematics')
  new_question = Question.find_by(description: question)

  if new_question
    puts "Question: #{new_question} já existe."
  else
    new_question = Question.create!(description: question, category: category)
    create_options_questions_math(new_question, index)
    puts "Question: #{new_question} criada com sucesso!"
  end
end

# questions portuguese

['O que é acento?', 'O que é verbo?', 'O que é substantivo?','O que é adjetivo?'].each_with_index do |question, index|
    category = Category.find_by(name: 'portuguese')
    new_question = Question.find_by(description: question)

    if new_question
      puts "Question: #{new_question} já existe."
    else
      new_question = Question.create!(description: question, category: category)
      create_options_questions_portuguese(new_question, index)
      puts "Question: #{new_question} criada com sucesso!"
    end
end
