json.round do
  json.id @round.id
  json.player_id @round.player_id

  json.questions @round.reload.questions.map do |question|
    json.partial! 'questions/question', question:
  end

  json.answers []
end
