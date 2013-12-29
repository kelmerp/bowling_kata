require 'bowling_scorer'

describe BowlingScorer do
  it "scores a game of gutters" do
    game = BowlingScorer.new
    20.times { game.roll(0) }
    game.score.should == 0
  end

  it "scores a game of single pin rolls" do
    game = BowlingScorer.new
    20.times { game.roll(1) }
    game.score.should == 20
  end
end