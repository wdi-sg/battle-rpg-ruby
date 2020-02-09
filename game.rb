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

# Run this code. It damages the monster / enemy for each "turn".
# monster = Monster.new

# while monster.get_hp > 0 do
#   puts "how much damage do you want to do?"
#   input = gets.chomp
#   monster.set_hp input.to_i
#   puts "monster has damage: "+monster.get_hp.to_s
# end

# puts "done with game!"


# PART II - Create an array that contains multiple monsters for the player to fight.     Ask the player which monster they want to attack at the beginning of the turn. (add the prompt into the loop)

monster1 = Monster.new
monster2 = Monster.new
monster3 = Monster.new

monster_array = [monster1, monster2, monster3]

while monster_array.length > 0 do
  if (monster_array.length == 3)
    puts "Which monster do you wana kill? Choose 1, 2 or 3"
    chosen_monster = gets.chomp
    puts "You've chosen monster " + chosen_monster
    puts "how much damage do you want to do?"
    input = gets.chomp
    monster_array[chosen_monster.to_i - 1].set_hp input.to_i
  elsif (monster_array.length == 2)
    puts "Which monster do you wana kill? Choose 1 or 2"
    chosen_monster = gets.chomp
    puts "You've chosen monster " + chosen_monster
    puts "how much damage do you want to do?"
    input = gets.chomp
    monster_array[chosen_monster.to_i - 1].set_hp input.to_i
  else
    puts "One monster left, you're quite skillful"
    chosen_monster = 1
    puts "how much damage do you want to do?"
    input = gets.chomp
    monster_array[chosen_monster.to_i - 1].set_hp input.to_i
end
    monster_array.each do |monster|
    puts "#{monster} HP remaining: #{monster.get_hp}"
    end
    monster_array.each do |monster|
    if monster.get_hp < 0
      monster_array.delete_at(chosen_monster.to_i - 1)
    end
  end

end

puts "done with game!"