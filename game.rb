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

class Player
end

class MonsterTruck
  attr_accessor :moster
  def initialize
    @monster = []
    @hp = 1000
  end

  def get_hp
    @hp
  end

  def set_hp(damage)
    @hp = @hp - damage
  end

  def set_monsters count
    count.times do
      @monster << Monster.new
    end
  end
  def get_monsters
    @monster
  end
  def remove_monsters index
    @monster.delete_at(index)
  end
  def total_monsters
    @monster.length
  end
end
truck = MonsterTruck.new
puts "how many monsters should be in the game?"
monster_count = gets.chomp
truck.set_monsters(monster_count.to_i)

while truck.total_monsters > 0 do
  if truck.get_hp > 0
  puts "how much damage do you want to do to the monster truck?"
  truck_damage = gets.chomp.to_i
  truck.set_hp truck_damage.to_i
  puts "monster has damage: "+truck.get_hp.to_s
  if truck.get_hp<=0
    puts "You've defeated the monster truck"
  end
  else
  puts "Which monster you want to attack?"
  truck.get_monsters.map.with_index do |monster, i|
    print "Monster [#{i.to_s}] "
  end
  print "?:"
  index = gets.chomp.to_i
  if truck.get_monsters[index]
  puts "how much damage do you want to do?"
  input = gets.chomp
  truck.get_monsters[index].set_hp input.to_i
  puts "monster has damage: "+truck.get_monsters[index].get_hp.to_s
  if truck.get_monsters[index].get_hp<=0
    puts "You've defeated a monster"
     puts
    truck.remove_monsters index
  end
  else
    puts
    puts "Monster does not exist"
    puts
  end
end
end

puts "done with game!"