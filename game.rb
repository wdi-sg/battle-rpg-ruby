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
class MonsterList
  attr_accessor :moster
  def initialize(monster)
    @monster = monster
  end
end
monsters =[Monster.new , Monster.new ,Monster.new]

while monsters.length > 0 do
  puts "Which monster you want to attack?"
  monsters.map.with_index do |monster, i|
    print "Monster #{i.to_s} "
  end
  print "?:"
  index = gets.chomp.to_i
  if monsters[index]
  puts "how much damage do you want to do?"
  input = gets.chomp
  monsters[index].set_hp input.to_i
  puts "monster has damage: "+monsters[index].get_hp.to_s
  if monsters[index].get_hp<=0
    puts "You've defeated a monster"
     puts
    monsters.delete_at(index)
  end
  else
    puts
    puts "Monster does not exist"
    puts
  end
end

puts "done with game!"