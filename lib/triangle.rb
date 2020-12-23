class Triangle
  attr_accessor :side_one, :side_two, :side_three, :sides

  def initialize(l_one, l_two, l_three)
    @side_one = l_one
    @side_two = l_two
    @side_three = l_three
    @sides = [@side_one, @side_two, @side_three]
  end

  def kind
    if self.valid?
      if self.sides.uniq.length == 1
        :equilateral
      elsif self.sides.uniq.length == 2
        :isosceles
      elsif self.sides.uniq.length == 3
        :scalene
      end
    else
      raise TriangleError
    end
  end

  def valid?
    if self.side_one + self.side_two > self.side_three && self.side_two + self.side_three > self.side_one && self.side_one + self.side_three > self.side_two
      self.sides.all? {|side| side > 0} 
    else
      false
    end
  end

  class TriangleError < StandardError
    
  end

end
