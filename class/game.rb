class Game
  attr_accessor :turn, :player1, :player2

  def initialize
    # create players when create is initiated
    @player1 = Player.new
    @player2 = Player.new
    # player 1 turn first then alternate
    @turn = 1
 
  end 

  # start new turn after each player answer until a player runs out of lives
  def start
    # announce lives at start of each round
    puts "Player 1: #{@player1.lives}/3 lives. Player 2: #{@player2.lives}/3 lives."

    # ask a question and pass player turn to question class
    question = Question.new(turn)

    # if question.start return false (player answered incorrectly) 
    if !question.start
      update_lives(turn)
    end
    # then update player turn from 1 to 2 / 2 to 1
    update_turn(turn)
  end
  
  def update_turn(turn)
    turn === 1 ? @turn = 2 : @turn = 1
    # go back to start a new round for next player turn
    start
  end

  def update_lives(turn)
    turn === 1 ?  @player1.lose_a_life : @player2.lose_a_life

    # go to game over method when a play runs out of lives
    if @player1.lives === 0 || @player2.lives === 0
      game_over
    end
  end
  
    def game_over
      puts "Player 1: #{@player1.lives}/3 lives. Player 2: #{@player2.lives}/3 lives."
      puts "😑 GAME OVER 🥺"
      exit
    end
  
end