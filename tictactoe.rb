STDOUT.sync = true

class PlayGame
    attr_accessor :board, :turn, :gameEnd
    def initialize
        @places = ['','','','','','','','','']
        @gameEnd = false
        @turn = 0
    end

    def mainLoop
        self.updateDisplay
        while @gameEnd == false && @turn < 9
            puts "Player " + (@turn % 2 + 1).to_s + ", choose a position (1 - 9): "
            pos = gets.to_i - 1
            while self.validPosition?(pos) != true
                puts "Enter a valid position: "
                pos = gets.to_i - 1
            end
            self.placePiece(pos, turn)
            self.updateDisplay
            if self.winCheck?(pos, turn)
                @gameEnd = true
            end
            @turn += 1
        end
        puts "\n\nPlayer " + ((@turn + 1) % 2 + 1).to_s + " wins!"
    end

    def updateDisplay
        board = ''
        (0..8).step(3) do |i|
            board += "| #{@places[i]} | #{@places[i + 1]} | #{@places[i + 2]} |\n"
        end
        puts board + "\n\n\n"
    end

    def placePiece(pos, turn)
        if turn % 2 == 0
            @places[pos.to_i] =  'X'
        else
            @places[pos.to_i] =  'O'
        end
    end

    def validPosition?(pos)
        if @places[pos.to_i] == ''
            return true
        else
            return false
        end
    end

    def winCheck?(pos, turn)
        if @places[0] == @places[1] && @places[0] == @places[2] && @places[0] != ''
            return true
        elsif @places[3] == @places[4] && @places[3] == @places[5] && @places[3] != ''
            return true
        elsif @places[6] == @places[7] && @places[6] == @places[8] && @places[6] != ''
            return true
        elsif @places[0] == @places[3] && @places[0] == @places[6] && @places[0] != ''
            return true
        elsif @places[1] == @places[4] && @places[1] == @places[7] && @places[1] != ''
            return true
        elsif @places[2] == @places[5] && @places[2] == @places[8] && @places[2] != ''
            return true
        elsif @places[0] == @places[5] && @places[0] == @places[8] && @places[0] != ''
            return true
        elsif @places[2] == @places[5] && @places[2] == @places[8] && @places[2] != ''
            return true 
        end
    end
end

game = PlayGame.new
game.mainLoop