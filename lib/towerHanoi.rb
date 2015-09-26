class TowersOfHanoi
	def initialize(num_discs)
		@num_discs = num_discs
		@towers = []
		@towers << (1..num_discs).to_a.reverse
		@towers << []
		@towers << []
		@num_moves = 0
	end

	def solved?
  		@towers[0].empty? && @towers[1..-1].any? { |tower| tower.empty? } && @towers.each { |tower| tower.sort == tower}
  	end

	def display
		@towers.each_with_index do |tower, index|
		  40.times { print "_" }
		  puts "\nTower #{index + 1} - (#) #{@towers[index].join(", ")}\n"
		end
		40.times { print "_" }
	end

	def valid_move
	  # Get valid tower numbers
  	start_tower, end_tower = [nil, nil].map.with_index do |tower, index|
  	  while tower == nil || ! (0..2).include?(tower)
  		  puts "\nInput the tower you want #{index == 1 ? "add a disc to" : "remove a disc from"} (1, 2, or 3)"
  		  tower = gets.chomp.to_i  - 1
  		  puts "#{tower + 1} is not a valid tower" if ! (0..2).include?(tower)
  		end
  		tower
  	end

  	# Check for improperly stacked discs
  	if ! @towers[end_tower].empty? && @towers[start_tower][-1] > @towers[end_tower][-1]
  	  puts "You can't place a bigger disc on a smaller disc"
  	  get_valid_move()
  	end

  	[start_tower, end_tower]
	end

	def move(start_tower, end_tower)
	  @towers[end_tower].push(@towers[start_tower].pop())
	  @num_moves += 1
	end

	def run
		until solved?()
			display()
      move(*valid_move())
		end
	  puts "\nYou won in #{@num_moves} moves"
	  puts "The best score possible is #{2 ** @num_discs - 1} moves"
  end
end


puts "Input the number of discs: "
num_discs = gets.chomp.to_i

game = TowersOfHanoi.new(num_discs)
game.run
