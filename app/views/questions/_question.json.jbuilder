
json.id question.id
json.description question.description
json.options question.options.map { |option| { id: option.id, label: option.label } }
