class BowlingScorer
  attr_reader :score
  attr_accessor :rolls

  def initialize
    @score = 0
    @rolls = []
  end

  def roll(pins)
    rolls << pins
  end

  def score
    @roll_index = 0
    
    10.times do 
      if is_strike?
        score_strike_bonus
        @roll_index += 1
      elsif is_spare?
        score_spare_bonus
        @roll_index += 2
      else
        score_standard_frame
        @roll_index += 2
      end
    end

    @score
  end

  private
  def is_spare?
    rolls[@roll_index] + rolls[@roll_index + 1] == 10
  end

  def is_strike?
    rolls[@roll_index] == 10
  end

  def score_spare_bonus
    @score += 10 + rolls[@roll_index + 2]
  end

  def score_strike_bonus
    @score += 10 + rolls[@roll_index + 1] + rolls[@roll_index + 2]
  end

  def score_standard_frame
    @score += rolls[@roll_index] + rolls[@roll_index + 1]
  end
end