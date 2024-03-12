json.round do
  json.id @round.id
  json.player_id @round.player_id
  json.total_questions @round.total_questions
  json.total_answered_questions @round.total_answered_questions
  json.total_correct_answers @round.total_correct_answers
end
