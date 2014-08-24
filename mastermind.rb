# Welcome to Bomb Squad, I wanted to do something a little different within the master-mind perimeters
# I thought by introducing the idea of defusing a bomb was a nice way to structure a super lite story around the code.
# this game is played with a player and the computer. The computer generates a 4 character code that the player must break
# if the code is broken, the people are saved. if the player does not get the code by the 10th attempt, the bomb goes off



# game class as well as colors for the MM choices
class Bombsquad
	COLORS = ["R", "Y", "W", "O", "B", "P"]

# computer and Plater
	def initialize(start)
		@player = Player.new
		@computer = Computer.new
		@start = Start.new 
	end


	# all possible outcomes of the game, in def play it shows that i represents the number of turns and has + and - 1 to represent the progression
	# in turns. if the code is precise a message will say you won. if It is close and or/on point the player will also be notified

	def play
			puts "@start => " + @start.inspect
			puts "Start Game."
		start = @start

		10.times do |i| 
			puts "This is your #{i + 1} turn of 10 you have #{i - 1} chances to break the code or the bomb will go off. The clock is ticking."
			puts "Are you feeling nervous?"
			current_guess = @player.code_break
			standing = unknown_guess(current_guess)

		if standing[:precise].length == 4
			puts "The bomb has been defused, you saved the day!"
			return

		else
			puts "#{standing[:precise].length} selections are in the code, still not enough to save the world...."
			puts "#{standing[:close].length} selections are close to the code, but still not enough to defuse the bomb."
		end
	end

    puts "tick...tick..........tick.......................................click." 
	puts "KAAAAAAAAAAAAAAAAABOOOM! The bomb blew up, you should have studied harder at the academy. GAME OVER!!!!!!!!!!!!!!!!"
	return
end

#takes the two arguments and applys them to the the code

def unknown_guess(current_guess)
	outcome = { :precise => [], :close => []}
	current_guess.each_with_index do |pick, placement|
		if precise_match?(choice, position)
			results[:precise] << true
		elsif close_match?(pick)
			results[:close] << true
		end
	end
	results

end

# asks the computer if the match is close via pick/placement 

def close_match? (pick, placement)
	choice == @computer.code_combo[placement]
end
end




# the colors are generated and shuffled each game in the computer class
class Computer
	attr_reader :code_combo
def initialize 
	@code_combo = code
end 

	#helps generate the colors as well as shuffle them for a new outcome every game.

	def code
		colors = Bombsquad::COLORS.shuffle
		generated_code = []
		4.times{ generated_code << colors}
		generated_code
	end
end

#this is the opening setting where the player is presented with the problem and how to solve it.

class Player
	def code_break
		puts "Bomb Squad: The Game"
		puts "Attention, Attention!!"
		puts "Welcome to your first day on the job"
		puts "You are a member of the Bomb Squad. You have been alerted of a bomb threat that involves a 4 color code."
		puts "If you can't break the code in 10 attempts, the bomb will detonate."
		puts "You are the only one who can break it."
		puts "Good luck, everyone is counting on you."
		puts "Your choices are R (red), Y (yellow), W (white), O (orange), B (blue), and P (purple)"
		puts "Don't screw this up buddy times-a-wastin'"
		puts "tick.....tick.....tick........"
		second_guess(gets.chomp)
	end

	def second_guess(guess)
		guess.split('')
	end
end

