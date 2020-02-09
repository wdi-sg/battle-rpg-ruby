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
  def initialize
    @hp = 30
  end

  def get_hp
    @hp
  end

  def set_hp(damage)
    @hp = @hp - damage
  end
end

class Truck
  def initialize
    @monsters = []
    @hp = 30
  end

  def monsters
    @monsters
  end

  def get_hp
    @hp
  end

  def set_hp(damage)
    @hp = @hp - damage
  end

  def spawn_monsters(monster_count)
    index = 1
    while index <= monster_count.to_i
      @monsters.push(monster = Monster.new)
      index += 1
    end
  end
end

# playing around with methods
def dealDamage(arr, monsterIndex, damage)
  arr[monsterIndex].set_hp(damage)
end

# initialize player
player = Player.new

# initialize truck
truck = Truck.new
# create monster instances
puts "How many monsters should be in the game?"
monster_count = gets.chomp
truck.spawn_monsters(monster_count)

# destroy truck before attacking monsters
while truck.get_hp > 0 && player.get_hp > 0
  puts "You are fighting a truck full of monsters! Destroy its armor!"
  puts "How much damage do you want to do?"
  input = gets.chomp
  truck.set_hp(input.to_i)

  puts "Remaining truck armor: #{truck.get_hp}"

  if truck.get_hp <= 0
    puts "Truck armor is destroyed! Time for monster meat!"
  end

  if truck.get_hp > 0
    puts "The truck attacks you for 2 Damage!"
    player.set_hp(2)
  end

  if player.get_hp <= 0
    puts "The truck supercharges its fiddly sprizzly wiggly chaotically magically railgun and overpowers you with a rainbow, by the POWER of grayskull"
  else
    puts "You have #{player.get_hp}HP"
  end

end

# truck is destroyed, now can attack monsters
while truck.monsters.length > 0 && truck.get_hp <= 0 && player.get_hp > 0
  puts "You are fighting #{truck.monsters.length} Monsters"

  if truck.monsters.length > 1
    puts "Which monster do you want to attack?"
    select_input = gets.chomp
    puts "how much damage do you want to do?"
    input = gets.chomp
    dealDamage(truck.monsters, select_input.to_i - 1, input.to_i)
  else
    select_input = 1
    puts "how much damage do you want to do?"
    input = gets.chomp
    dealDamage(truck.monsters, select_input.to_i - 1, input.to_i)
  end

  puts "You, a Paladin with 18 Charisma and 97 hitpoints, attack monster#{select_input} with your Helm of Disintegration, and your Half-elf mage is wielding his +5 holy avenger, causing: " + input + " Damage"

  truck.monsters.each do |monster|
    if monster.get_hp <= 0
      puts "You quickly strongly magically heroically enthusiastically pulverized that sucker"
      truck.monsters.delete_at(select_input.to_i - 1)
    end
  end

  truck.monsters.each do |monster|
    puts "Remaining HP of #{monster}: #{monster.get_hp}"
  end

  truck.monsters.each do |monster|
    if player.get_hp > 0
      puts "#{monster} attacks you for 3 damage!"
      player.set_hp(3)
    end
  end

  if player.get_hp > 0
    puts "You have #{player.get_hp}HP"
  else
    puts "The monster horde struck you down!"
  end
end

puts "Game over!"
