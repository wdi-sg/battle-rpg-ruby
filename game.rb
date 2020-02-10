puts "Start playing!"

class Monster
  def initialize(name)
    @hp = 10
    @name = name
  end

  def get_hp
    @hp
  end

  def set_hp(damage)
    @hp = @hp - damage
  end

  def get_name
    @name
  end

end

class Player
end


# At the beginning of the game ask the player how many monsters they would like to fight:
# Use a loop to fill a dynamic number of monsters into the array before the game starts, using the monster_count variable.

puts "how many monsters should be in the game?"
monster_count = gets.chomp
arrayLength = monster_count.to_i
monsters = []
monsterArr = (1..arrayLength).each { |i| "monster#{i}" = Monster.new("monster#{i}") }
p monsters

while "monster{i}".get_hp >= 0 do
  puts "choose a monster to attack: "
  monsterOptions = monsters.each {|option| print option.get_name, "," }
  response = gets.chomp
      if response.to_s == "monster1" || response.to_i == 1
      print "how much damage do you want to do to #{monster1.get_name}?"
      input = gets.chomp
      monster1.set_hp input.to_i
      puts "#{monster1.get_name} has damage: "+monster1.get_hp.to_s

      elsif response.to_s == "monster2" || response.to_i == 2
      print "how much damage do you want to do to #{monster2.get_name}?"
      input = gets.chomp
      monster2.set_hp input.to_i
      puts "#{monster2.get_name} has damage: "+monster2.get_hp.to_s

      elsif response.to_s == "monster3" || response.to_i == 3
      print "how much damage do you want to do to #{monster3.get_name}?"
      input = gets.chomp
      monster3.set_hp input.to_i
      puts "#{monster3.get_name} has damage: "+monster3.get_hp.to_s

      else response.to_s.empty == true
      break
      end
end

puts "done with game!"
