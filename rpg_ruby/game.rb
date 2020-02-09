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

monsterArr = [];

monsters.each_with_index do |monster, i|
  while monster.get_hp > 0 do

  puts "how many monsters should be in the game?"
  monster_count = gets.chomp.to_i

  for i in 1..monster_count do
      monsterArr.push(monsters[rand(monsters.length)])
    end

  puts "Length " + monsterArr.length.to_s

  puts "Which Monster would you like to slay?"
  chosen_monster = gets.chomp.to_i
  puts "how much damage do you want to do?"
  damage = gets.chomp
  monsterArr[chosen_monster].set_hp damage.to_i
  puts "monster has damage: "+ monsterArr[chosen_monster].get_hp.to_s
  puts "you have done " +  damage.to_s + " damage to " + monsterArr[chosen_monster].get_name
  monsterArr.each_with_index do |monster, i|
  puts "Remanding monsters " + monsterArr[i].get_name + " HP: " + monsterArr[i].get_hp.to_s
    end
  end
end

puts "done with game!"