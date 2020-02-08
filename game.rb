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

monsters = [
monster1 = Monster.new,
monster2 = Monster.new,
monster3 = Monster.new,
]

monsters = []

puts "How many monsters should be in the game?"
monster_count = gets.chomp
index = 1
while index <= monster_count.to_i do
  monsters.push(monster = Monster.new)
  index += 1
end

def dealDamage(arr, monsterIndex, damage)
  arr[monsterIndex].set_hp(damage)
end

while monsters.length > 0 do
  puts "You are fighting #{monsters.length} Monsters"

    if monsters.length > 1
      puts "Which monster do you want to attack?"
      select_input = gets.chomp
      puts "how much damage do you want to do?"
      input = gets.chomp
      dealDamage(monsters, select_input.to_i - 1, input.to_i)
    else
      select_input = 1
      puts "how much damage do you want to do?"
      input = gets.chomp
      dealDamage(monsters, select_input.to_i - 1, input.to_i)
    end

  puts "You, a Paladin with 18 Charisma and 97 hitpoints, attack monster#{select_input} with your Helm of Disintegration, and your Half-elf mage is wielding his +5 holy avenger, causing: "+ input +" Damage"
# UP NEXT: Check for error, replace the hashtag monster thingy and replace with monster placeholder

  monsters.each do |monster|  
    if monster.get_hp <= 0
      puts "You quickly strongly magically heroically enthusiastically pulverized that sucker"
      monsters.delete_at(select_input.to_i - 1)
    end
  end 

  monsters.each do |monster|  
    puts "Remaining HP of #{monster}: #{monster.get_hp}"
  end 

end

puts "done with game!"
