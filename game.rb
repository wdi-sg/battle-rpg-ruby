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

# puts monsters

puts "how many monsters should be in the game?"
monster_count = gets.chomp.to_i

if monster_count > 0
  monsters.each_with_index do |monster, index|
    puts "which monster do you want to choose?"
    chosen_monster = gets.chomp.to_i
    puts "you've chosen monster " + chosen_monster.to_s
    puts monsters[chosen_monster].to_s
    while monsters[chosen_monster].get_hp > 0
      puts "how much damage do you want to do?"
      damage = gets.chomp.to_i
      monsters[chosen_monster].set_hp damage.to_i
      puts "monster has damage: " + monsters[chosen_monster].get_hp.to_s
    end
    puts "done with game!"
  end
end
