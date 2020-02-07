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

monster = Monster.new


while monster.get_hp > 0 do
  puts "how much damage do you want to do?"
  input = gets.chomp
  monster.set_hp input.to_i
  puts "monster has damage: "+monster.get_hp.to_s
end

puts "done with game!"
