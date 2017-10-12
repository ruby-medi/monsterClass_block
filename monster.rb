class Monster
  attr_reader :name, :actions
  
  def initialize(name)
    @name=name
    @actions = {
      scream:0, 
      scares:0,
      run:0,
      hide:0
    }
  end
  
  def say(&block)
    print "#{name} says ..."
    yield
  end
  

  
  def print_scoreboard
    puts "------------------------"
    puts "#{name} scoreboard"
    puts "------------------------"
    puts " - Screams: #{actions[:scream]}"
    puts " - runs: #{actions[:scares]}"
    puts " - runs: #{actions[:run]}"
    puts " - runs: #{actions[:hide]}"
    puts "------------------------"
  end
  
  def scream(&block)
    actions[:scream] += 1
    print "#{name} screams! "
    yield
  end
  
  def scare(&block)
    actions[:scares] += 1
    print "#{name} scares you!"
    yield
  end
  
  def run(&block)
    actions[:run] += 1
    print "#{name} run!"
    yield
  end
  
  
  def hide(&block)
    actions[:hide] += 1
    print "#{name} hide!"
    yield self if block_given?
    
  end
  #yield self let you use class variable outside of the class
  #block_given? use yield only if block is use in this method
  
end

monster = Monster.new("fluffy")

monster.say do
  puts "Welcome to my home."
end



monster.scream do
  puts "boo!"
end

monster.scare do
  puts "go away!"
end

monster.run do
  puts "going to eat you!"
end

monster.hide do |monster|
  puts "running away and hiding!"
  puts monster.actions.inspect
end

puts "\n"
puts monster.print_scoreboard