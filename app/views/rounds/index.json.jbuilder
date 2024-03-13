json.rounds @rounds do |round|
  json.id round.id
  json.player_id round.player_id
  json.questions round.questions do |question|
    json.id question.id
    json.description question.description
    json.options question.options do |option|
      json.id option.id
      json.label option.label
    end
  end
  json.answers round.answers do |answer|
    json.id answer.id
    json.question_id answer.question_id
    json.option_id answer.option_id
    json.correct answer.correct
  end
end
