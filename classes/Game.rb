class Game
  attr_accessor :current_player, :current_round, :players
  def initialize
    @current_player = nil
    @players = []
    @current_round = 1
  end

  def run
    p1 = Player.new("Player 1")
    players << p1
    p2 = Player.new("Player 2")
    players << p2
    @current_player = p2
    while current_player.lives > 0
      round
    end
    game_over
  end

  def switch_players
    if @current_player == players[0]
      @current_player = players[1]
    else
      @current_player = players[0]
      
    end
  end
  
  def round
    switch_players
    question = Question.new
    puts "#{current_player.name}: What is #{question.num1} + #{question.num2}?"
    answer = gets.chomp.to_i

    if answer == question.answer
      puts "#{@current_player.name}: Correct"
    else
      puts "#{@current_player.name}: Incorrect"
      @current_player.lose_life
    end
    puts "P1: #{players[0].lives} - P2: #{players[1].lives}"
    puts "----- NEW TURN -----"
    @current_round += 1
  end
  
  def game_over
    switch_players
    puts "#{current_player.name} wins with a score of #{current_player.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end