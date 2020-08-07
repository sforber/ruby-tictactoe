require "./lib/game.rb"

describe Game do
    describe "#placePiece" do
        it "updates @places to incude the player's piece at the position" do
            game = Game.new
            game.placePiece(0, 0)
            expect(game.places[0]).to eql('X')
        end

        it "updates @places to incude the player's piece at the position" do
            game = Game.new
            game.placePiece(1, 1)
            expect(game.places[1]).to eql('O')
        end
    end

    describe "#validPosition?" do
        it "returns true if position is between 1 and 9" do
            game = Game.new
            expect(game.validPosition?(1)).to eql(true)
        end

        it "returns false if position is not between 1 and 9" do
            game = Game.new
            expect(game.validPosition?(10)).to eql(false)
        end

        it "returns false if position is already occupied" do
            game = Game.new
            game.places[0] = "X"
            expect(game.validPosition?(0)).to eql(false)
        end
    end

    describe "#winCheck?" do
        it "returns true if top row is occupied by the same player" do
            game = Game.new
            game.places[0], game.places[1], game.places[2] = "X", "X", "X"
            expect(game.winCheck?).to eql(true)
        end

        it "returns true if middle row is occupied by the same player" do
            game = Game.new
            game.places[3], game.places[4], game.places[5] = "X", "X", "X"
            expect(game.winCheck?).to eql(true)
        end

        it "returns true if bottom row is occupied by the same player" do
            game = Game.new
            game.places[6], game.places[7], game.places[8] = "X", "X", "X"
            expect(game.winCheck?).to eql(true)
        end

        it "returns true if left column is occupied by the same player" do
            game = Game.new
            game.places[0], game.places[3], game.places[6] = "X", "X", "X"
            expect(game.winCheck?).to eql(true)
        end

        it "returns true if middle column is occupied by the same player" do
            game = Game.new
            game.places[1], game.places[4], game.places[7] = "X", "X", "X"
            expect(game.winCheck?).to eql(true)
        end

        it "returns true if right column is occupied by the same player" do
            game = Game.new
            game.places[2], game.places[5], game.places[8] = "X", "X", "X"
            expect(game.winCheck?).to eql(true)
        end

        it "returns true if left diagonal is occupied by the same player" do
            game = Game.new
            game.places[0], game.places[4], game.places[8] = "X", "X", "X"
            expect(game.winCheck?).to eql(true)
        end

        it "returns true if right diagonal is occupied by the same player" do
            game = Game.new
            game.places[2], game.places[4], game.places[6] = "X", "X", "X"
            expect(game.winCheck?).to eql(true)
        end
    end
end