#!usr/bin/ruby

#dir can be north(N), south(S) , east(E) , west(W)
 

class Rover
	attr_accessor :i
	attr_accessor :j
	attr_accessor :dir
	attr_accessor :max_i
	attr_accessor :max_j
	
	def initialize(i,j,dir,mars)
		if mars.class != Mars
			raise "mars is not Mars object"		
		end
		
		if i>mars.max_i || j>mars.max_j || i<0 || j<0
			raise "rover not on mars"
		end

		if dir!="N" && dir!="S" && dir!="W" && dir!="E" 
			raise "Invalid State"
		end

		@i = i
		@j = j
		@dir = dir
		@max_i = mars.max_i
		@max_j = mars.max_j
	end
						  

	def move(s)
		case s
			when "M"
			moveahead
			
			when "L" 
			moveleft

			when "R" 
			moveright
			
			else
			raise "Wrong Command" 
		end
	end


	def moveahead
	
		case @dir
			when "N"
				if @i+1 <= @max_i
					@i = @i + 1
				else
					raise "Out of Bound"	
				end

			when "W"
				if @j-1 >= 0
				@j = @j -1 
				else
				raise "Out of Bound"	
				end

			when "E"
				if @j+1 <= @max_j
				@j = @j +1 
				else
				raise "Out of Bound"	
								
				end

			when "S"
				if @i-1 >= 0
				@i = @i -1 
				else
				raise "Out of Bound"	
				
				end

			else
			raise "Invalid State"

		end 
	end




	def moveleft
		case @dir
			when "N"
			@dir = "W"

			when "W"
			@dir = "S" 

			when "E"
			@dir = "N" 

			when "S"
			@dir = "E" 

			else
			raise "Invalid State"

		end 
	end	


	def moveright
		case @dir
			when "N"
			@dir = "E"

			when "W"
			@dir = "N" 

			when "E"
			@dir = "S" 

			when "S"
			@dir = "W" 


			else
			raise "Invalid State"

		end 
	end	


end

