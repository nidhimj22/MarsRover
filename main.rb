#!usr/bin/ruby

$LOAD_PATH << File.dirname(__FILE__)

require 'mars'
require 'rover'

class Main
	def initialize
		temp = gets
		temp = temp.split(" ")
		a = temp[0].to_i
		b = temp[1].to_i
		mars = Mars.new(a,b) 
		while true
			line = gets
			break if line == "\n" || line == nil
			i, j , dir = line.split(" ")
			rover = Rover.new(j.to_i,i.to_i,dir,mars)
			input = gets
			input = input.chomp
			input.each_char{ |char|
 				rover.move(char.to_s)
				}
			puts "#{rover.j} #{rover.i} #{rover.dir}" 
		end	
	
	end
end

t = Main.new


