json.round do
  json.id @round.id
  json.player_id @round.player_id
  json.questions @round.questions.map do |question|
    {
      id: question.id,
      description: question.description,
      options: question.options.map { |option| { id: option.id, label: option.label } }
    }
  end
  json.answers []
end
