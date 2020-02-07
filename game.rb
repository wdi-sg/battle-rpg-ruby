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

monsters = [monster1, monster2, monster3]

monsters.each_with_index do |monster, index|
  while monster.get_hp > 0
  puts "Which monster do you wanna attack?"
  chosen_monster = gets.chomp.to_i
  puts "How much damage do you wanna do?"
  damage = gets.chomp
  monsters[chosen_monster].set_hp damage.to_i
  puts "You did " + damage + " damage to monster " + chosen_monster.to_s
    monsters.each_with_index do |monster, index|
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