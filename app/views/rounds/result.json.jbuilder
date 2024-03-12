json.round do
  json.id @round.id
  json.player_id @round.player_id
  json.total_questions @round.questions.count
  json.total_answered_questions @round.answers.count
  json.total_correct_answers @round.answers.where(correct: true).count
end
