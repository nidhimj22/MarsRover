#!usr/bin/ruby

require_relative "mars"
require_relative "rover"
require "test/unit"
 
class MarsTest < Test::Unit::TestCase
  
	def setup
	    @mars = Mars.new(5, 5)
	end
	
	def test_mars_is_an_object_of_Mars
	    assert_equal @mars.class, Mars
  	end

	def test_max_i
    		assert_equal 5, @mars.max_i
  	end

  	def test_max_j
    		assert_equal 5, @mars.max_j
  	end

  	def test_negative_dimension_throws_error
    		begin
      			@mars = Mars.new(-1, -2)
    			rescue StandardError => ex
      			assert_equal "Negative not allowed", ex.message
    		end
  	end
	
end

class RoverTest < Test::Unit::TestCase

def setup
    mars = Mars.new(5, 5)
    @rover = Rover.new(1, 2, "N",mars)
  end

  def test_rover_is_an_object_of_Rover
    assert_equal @rover.class, Rover
    assert_equal @rover.i, 1
    assert_equal @rover.j, 2
    assert_equal @rover.dir, "N"
    assert_equal @rover.max_i, 5
    assert_equal @rover.max_j, 5
  end

  def test_rover_throws_on_invalid_input
    	begin
      	@rover1 = Rover.new(1, 2,"N",1)
    	rescue StandardError => ex
      	assert_equal "mars is not Mars object", ex.message
    	end

	p = Mars.new(5,5)
	begin
	@rover1 = Rover.new(-1, 4, "W",p)
    	rescue StandardError => ex
      	assert_equal "rover not on mars", ex.message
    	end


	begin
	@rover1 = Rover.new(6, 4, "W",p)
    	rescue StandardError => ex
      	assert_equal "rover not on mars", ex.message
    	end


  end

  def test_move_method
  	@rover.move("L")
    	assert_equal @rover.i, 1
    	assert_equal @rover.j, 2
    	assert_equal @rover.dir, "W"

 	@rover.move("R")
  	assert_equal @rover.i, 1
  	assert_equal @rover.j, 2
    	assert_equal @rover.dir, "N"

	@rover.move("M")
  	assert_equal @rover.i, 2
  	assert_equal @rover.j, 2
    	assert_equal @rover.dir, "N"
    	
	begin
      		@rover.move("E") 
    		rescue StandardError => ex
      		assert_equal "Wrong Command", ex.message
    	end
  end


  def test_moveahead_method
  	@rover.moveahead
    	assert_equal @rover.i, 2
    	assert_equal @rover.j, 2
    	assert_equal @rover.dir, "N"

	@rover.moveleft
 	@rover.moveahead
  	assert_equal @rover.i, 2
  	assert_equal @rover.j, 1
    	assert_equal @rover.dir, "W"


	@rover.moveleft
	@rover.moveahead
  	assert_equal @rover.i, 1
  	assert_equal @rover.j, 1
    	assert_equal @rover.dir, "S"
    	
  end



  def test_moveleft_method
  	@rover.moveleft
    	assert_equal @rover.dir, "W"

	@rover.moveleft
    	assert_equal @rover.dir, "S"

	@rover.moveleft
	@rover.moveleft
    	assert_equal @rover.dir, "N"

	@rover.moveleft
	@rover.moveleft
	@rover.moveleft
	@rover.moveleft
    	assert_equal @rover.dir, "N"
    	
  end

  def test_moveright_method
  	@rover.moveright
    	assert_equal @rover.dir, "E"

	@rover.moveright
    	assert_equal @rover.dir, "S"

	@rover.moveright
	@rover.moveright
    	assert_equal @rover.dir, "N"

	@rover.moveright
	@rover.moveright
	@rover.moveright
	@rover.moveright
    	assert_equal @rover.dir, "N"
    	
  end

  def test_outofrange
	p = Mars.new(5, 5)
	
	begin
	@rover2 = Rover.new(5, 5, "N",p)
	@rover2.moveahead 
    	rescue StandardError => ex
      	assert_equal "Out of Bound", ex.message
	end
    
	begin
	@rover1 = Rover.new(5, 5, "N",p)
	@rover1.moveahead 
    	rescue StandardError => ex
      	assert_equal "Out of Bound", ex.message
    	end
  end

  def test_invalidstate
	p = Mars.new(5, 5)
	
	begin
	@rover1 = Rover.new(1, 1, "Q",p)
    	rescue StandardError => ex
      	assert_equal "Invalid State", ex.message
    	end

	begin
	@rover2 = Rover.new(4, 4, "L",p)
	@rover2.moveahead 
    	rescue StandardError => ex
      	assert_equal "Invalid State", ex.message
	end
    
	begin
	@rover1 = Rover.new(4, 4, "A",p)
	@rover1.moveleft 
    	rescue StandardError => ex
      	assert_equal "Invalid State", ex.message
    	end


	begin
	@rover1 = Rover.new(4, 4, "A",p)
	@rover1.moveright 
    	rescue StandardError => ex
      	assert_equal "Invalid State", ex.message
    	end
  end



end

