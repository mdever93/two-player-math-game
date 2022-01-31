class Player
  attr_reader :name
  attr_accessor :lives
  def initialize(name)
    @name = name
    @lives = 3
    
  end
end

P1 = Player.new("Player 1")
P2 = Player.new("Player 2")