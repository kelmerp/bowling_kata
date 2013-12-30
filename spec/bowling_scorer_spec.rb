require 'bowling_scorer'

describe BowlingScorer do
  let(:game) { BowlingScorer.new }

  it "scores a game of gutters" do
    20.times { game.roll(0) }
    game.score.should == 0
  end

  it "scores a game of single pin rolls" do
    20.times { game.roll(1) }
    game.score.should == 20
  end

  it "scores a spare" do
    2.times { game.roll(5) }
    game.roll(2)
    17.times { game.roll(0) }
    game.score.should == 14
  end

  it "scores a strike" do
    game.roll(10)
    game.roll(3)
    game.roll(3)
    16.times { game.roll(0) }
    game.score.should == 22
  end

  it "scores a perfect game" do
    12.times { game.roll(10) }
    game.score.should == 300
  end

  it "allows only a valid number rolls to be scored" do
    22.times { game.roll(1) }
    game.score.should == 20
  end
end