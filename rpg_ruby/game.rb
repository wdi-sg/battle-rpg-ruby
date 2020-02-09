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

monster1 = Monster.new
monster2 = Monster.new
monster3 = Monster.new


monsters = [monster1,monster2,monster3];




monsters.each_with_index do |monster, i|
  while monster.get_hp > 0 do
  puts "Which Monster would you like to slay?"
  chosen_monster = gets.chomp.to_i

  puts "monster " + chosen_monster.to_s

  puts "how much damage do you want to do?"
  input = gets.chomp
  monster.set_hp input.to_i
  puts "monster has damage: "+monster.get_hp.to_s
  end
end

puts "done with game!"