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

while monsters.length > 0 do

  if (monsters.length == 3)
    puts "Which monster do you want to attack? 1, 2 or 3?"
    select_input = gets.chomp
    puts "how much damage do you want to do?"
    input = gets.chomp
    monsters[select_input.to_i - 1].set_hp(input.to_i)
  elsif monsters.length == 2
    puts "Which monster do you want to attack? 1 or 2?"
    select_input = gets.chomp
    puts "how much damage do you want to do?"
    input = gets.chomp
    monsters[select_input.to_i - 1].set_hp(input.to_i)
  else
    puts "You are fighting one monster!"
    puts "how much damage do you want to do?"
    select_input = 1
    input = gets.chomp
    monsters[0].set_hp(input.to_i)
  end
  
  puts "You, a Paladin with 18 Charisma and 97 hitpoints, attack monster#{select_input} with your Helm of Disintegration, and your Half-elf mage is wielding his +5 holy avenger, causing: "+ input +" Damage"
# UP NEXT: Check for error, replace the hashtag monster thingy and replace with monster placeholder
  monsters.each do |monster|  
    puts "Remaining HP of #{monster}: #{monster.get_hp}"
    if monster.get_hp == 0
      monsters.delete_at(select_input.to_i - 1)
    end
  end 

end

puts "done with game!"
