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

monsterArray = [Monster.new, Monster.new, Monster.new ]

while monsterArray.length > 0 do
  monsterArray.each_with_index do |monster, index|
    if monster.get_hp <= 0
      monsterArray.delete_at index
    end
    puts "monster " + index.to_s + "has HP: " + monster.get_hp.to_s
  end
  puts "which monster would you like to attack?"
  index = gets.chomp.to_i
  puts "how much damage do you want to do?"
  input = gets.chomp.to_i
  monsterArray[index].set_hp input
end

puts "done with game!"
