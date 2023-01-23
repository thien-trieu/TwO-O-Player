class Player
  attr_accessor :lives

  def initialize
    @lives = 3   
  end

  def lose_a_life
    @live -= 1
  end

end