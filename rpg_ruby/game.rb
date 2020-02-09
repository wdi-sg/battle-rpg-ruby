class Monster
  def initialize(name)
    @hp = 10
    @name = name
  end

  def get_name
    @name
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

monster1 = Monster.new("Dragon")
monster2 = Monster.new("Demon")
monster3 = Monster.new("Zombie")


monsters = [monster1,monster2,monster3];




monsters.each_with_index do |monster, i|
  while monster.get_hp > 0 do
  puts "Which Monster would you like to slay?"
  chosen_monster = gets.chomp.to_i
  puts "how much damage do you want to do?"
  damage = gets.chomp
  monsters[chosen_monster].set_hp damage.to_i
  puts "monster has damage: "+ monsters[chosen_monster].get_hp.to_s
  puts "you have done " +  damage.to_s + " damage to " + monsters[chosen_monster].get_name
  monsters.each_with_index do |monster, i|
  puts "Remanding monsters" + monsters[i].get_name + " HP: " + monsters[i].get_hp.to_s
    end
  end
end

puts "done with game!"