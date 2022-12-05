def file_to_input(file)
  input = File.readlines(file, chomp:true).map(&:split)
end

file = "input.txt"
strategy = file_to_input(file)

def play_rps(array)
  all_your_scores = []
  opponent = {
    "A" => "Rock",
    "B" => "Paper",
    "C" => "Scissors"
  }

  me = {
    "X" => ["Rock", 1],
    "Y" => ["Paper", 2],
    "Z" => ["Scissors", 3]
  }

  round_outcome = {
    "won" => 6, 
    "lost" => 0,
    "draw" => 3
  }

  index = 0
  your_scores_for_round = 0

  array.each do |round|
    opponent_move = opponent[round[0]]
    my_move = me[round[1]]
    puts "me: #{my_move[0]}"
    puts "opponent: #{opponent_move}"

    if my_move[0] == opponent_move
      your_scores_for_round += (round_outcome["draw"] + my_move[1])
      puts "I played #{my_move[0]} and the elf played #{opponent_move}. Outcome: draw. My score is #{your_scores_for_round}."
    elsif my_move[0] == "Scissors" && opponent_move != "Rock"
      your_scores_for_round += (round_outcome["won"] + my_move[1])
      puts "I played #{my_move[0]} and the elf played #{opponent_move}. Outcome: I won. My score is #{your_scores_for_round}."
    elsif my_move[0] == "Paper" && opponent_move === "Rock"
      your_scores_for_round += (round_outcome["won"] + my_move[1])
      puts "I played #{my_move[0]} and the elf played #{opponent_move}. Outcome: I won. My score is #{your_scores_for_round}."
    elsif my_move[0] == "Rock" && opponent_move != "Paper"
      your_scores_for_round += (round_outcome["won"] + my_move[1])
      puts "I played #{my_move[0]} and the elf played #{opponent_move}. Outcome: I won. My score is #{your_scores_for_round}."
    else
      your_scores_for_round += (round_outcome["lost"] + my_move[1])
      puts "I played #{my_move[0]} and the elf played #{opponent_move}. Outcome: I lost. My score is #{your_scores_for_round}."
    end
    all_your_scores[index] = your_scores_for_round
    index += 1
    your_scores_for_round = 0
  end
  total_score = all_your_scores.reduce(0) { |sum, num| sum + num }
end

puts play_rps(strategy)