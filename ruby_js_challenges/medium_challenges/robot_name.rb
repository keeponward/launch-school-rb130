class Robot

  @@all_names_in_use = []

  attr_reader :name

  def initialize
    @name = nil
  end

  def name
    return @name unless @name == nil

    cand_name = ''
    loop do
      alpha1 = (rand(27) + 65).chr
      alpha2 = (rand(27) + 65).chr
      numeral = rand(1000).to_s
      while numeral.length < 3
        numeral.prepend('0')
      end
      cand_name =  alpha1 + alpha2 + numeral
      break unless @@all_names_in_use.include? (cand_name)
      # puts "name already exists"
    end
    @@all_names_in_use << cand_name
    @name = cand_name    
  end

  def reset
    if @name != nil
      @@all_names_in_use.delete(@name)
      @name = nil
    end
  end
end

# myRobot = Robot.new
# myR = Robot.new
# myR.name
# myR.reset

