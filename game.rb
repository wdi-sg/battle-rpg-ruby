class Monster
  # Initialise is called when you make a new monster
  # Monster.new(name)
  def initialize(name='Mr. No Name Monster')
    @hp = 10
    @name = name
  end

  # Define a function that a monster can do.
  # monster_name.roar
  def roar
    puts @name + " goes ROOOAAARRR!"
  end

  def put_hp
    puts @name + " has HP: " + @hp.to_s
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
#
# stuart = Monster.new("Stuart")
# stuart.roar()
# stuart.put_hp()
#
# eunice = Monster.new("Eunice")
# eunice.roar()
# eunice.put_hp()
#
# puts "Attack stuart for 3 damage"
# stuart.set_hp(3)
# stuart.put_hp()
# eunice.put_hp()

monsterArray = []

puts "How many monsters would you like to fight?"
input_number = gets.chomp.to_i
for i in 1..input_number do
  monsterArray << Monster.new
end

while monsterArray.length > 0 do
  monsterArray.each_with_index do |monster, index|
    puts "Monster index: " + index.to_s
    monster.put_hp
  end
  puts "which monster would you like to attack?"
  index = gets.chomp.to_i
  puts "how much damage do you want to do?"
  input = gets.chomp.to_i
  monsterArray[index].set_hp input
  monsterArray.each_with_index do |monster, index|
    if monster.get_hp <= 0
      puts monster.get_name + " has been defeated!"
      monsterArray.delete_at index
    end
  end
end

puts "done with game!"
