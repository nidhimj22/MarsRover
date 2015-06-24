class Mars
	attr_accessor :max_i
	attr_accessor :max_j
  	def initialize(max_i, max_j)
    		if max_i <= 0 || max_j <= 0
      			raise "Negative not allowed"
    		end
    		@max_i = max_i
    		@max_j = max_j
  	end
end
