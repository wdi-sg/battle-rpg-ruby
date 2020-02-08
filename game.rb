class Monster
  def initialize
    @hp = 10
  end

  def get_hp
    @hp
  end

  def set_hp(damage)
    @hp = @hp - damage
  end
end

class Truck
  def initialize (hp)
    @hp = hp
    @monsters = []
  end

  def get_hp
    @hp
  end

  def set_hp(damage)
    @hp = @hp - damage
  end

  def make_monsters(monster_count) 
    while @monsters.length < monster_count
    @monsters.push(Monster.new)
  end

  def truck_monsters
    @monsters
  end
end
end

class Player
end

puts "How much HP should the truck have?"
truckHP = gets.chomp.to_i
puts "How many monsters should be in the game?"
monster_count = gets.chomp.to_i

truck = Truck.new(truckHP)

truck.make_monsters(monster_count)

truck.truck_monsters.each_with_index do |monster, index|
  while monster.get_hp > 0
  puts "Which monster do you wanna attack?"
  chosen_monster = gets.chomp.to_i
  puts "How much damage do you wanna do?"
  damage = gets.chomp
  truck.truck_monsters[chosen_monster].set_hp damage.to_i
  puts "You did " + damage + " damage to monster " + chosen_monster.to_s
    truck.truck_monsters.each_with_index do |monster, index|
    puts "Monster " + index.to_s 
    puts "Remaining hp:" + monster.get_hp.to_s
    end
  end
end

# while monster.get_hp > 0 do
#   puts "how much damage do you want to do?"
#   input = gets.chomp
#   monster.set_hp input.to_i
#   puts "monster has damage: "+monster.get_hp.to_s
# end

puts "Game over!"