# Monster class
class Monster
  # Initialise is called when you make a new monster
  # Monster.new(name)
  def initialize(name=$monster_names.sample)
    @hp = 10
    @name = name
    @min_damage = 2
    @max_damage = 5
    @attack_string = " lunges wildly at "
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

  def attack(enemy)
    puts @name + @attack_string + enemy.get_name
    damage_dealt = rand(@max_damage - @min_damage) + @min_damage
    enemy.take_damage(damage_dealt)
  end

  def set_hp(damage)
    @hp = @hp - damage
  end
end

# The monster truck carries monsters, inherits from monsters
class MonsterTruck < Monster

  def initialize(monster_array, name)
    super(name)
    @monster_array = monster_array
    @hp = 20
    @min_damage = 1
    @max_damage = 3
    @attack_string = " revs its engine and tries to run over "
  end

  def how_many_inside
    @monster_array.length
  end

  def who_is_inside
    monster_on_board = []
    @monster_array.each do |monster|
      monster_on_board << monster.get_name
    end
    puts "On board the monster truck are " + monster_on_board.join(", ")
  end

  def set_hp(damage)
    @hp = @hp - damage
    if @hp <= 0
      destroy_truck
    end
  end

  def on_board_roar
    @monster_array.each do |monster|
      sleep 0.3
      monster.roar
    end
  end

  def destroy_truck
    puts "the monster truck has been destroyed!"
    puts "The other monsters come out of the truck and start fighting!"
    @monster_array.each do |monster|
      $monster_array << monster
      sleep 0.3
      monster.roar
    end
  end

end

# Pure fluff, a list of names the monsters could be called.
$monster_names = ["fancy bath slug", "figure-skating duck", "Frat Warrior drill sergeant", "ghastly organist", "gluttonous ghuol", "goblin conspirator", "Guy Made Of Bees", "Lumpy, the Sinister Sauceblob", "mutant rattlesnake", "Pifflehaus", "Dream Trawler", "Day9", "Teferi"]

# Player has a sword for a weapon because why not.
class Player
  attr_accessor :hp
  def initialize(name)
    @name = name
    @hp = 50
    @sword_damage = 10
    @sword_minimum = 5

  end

  def get_name
    @name
  end

  def take_damage(damage)
    puts "You take #{damage} damage! Ow!"
    @hp -= damage
    if @hp <= 0
      defeated
    end
  end

  def report_hp
    puts "You have #{@hp} HP."
  end

  def defeated
    puts "You have been defeated!"
  end

  def attack(monster)
    damage = rand(@sword_damage) + @sword_minimum
    puts "You swing at " + monster.get_name + " for " + damage.to_s + " damage."
    puts "BOOM! POW! SOCKO!"
    monster.set_hp(damage)
  end
end

# Loop through the monster array list to see if any have died. If they have, remove them from the array.
def check_enemy_dead
  $monster_array.each_with_index do |monster, index|
    if monster.get_hp <= 0
      puts monster.get_name + " has been defeated!"
      $monster_array.delete_at index
    end
  end
end

# The $ means it is a global variable. So very dangerous to use
$monster_array = [MonsterTruck.new([Monster.new, Monster.new, Monster.new], "Monster Truck")]

# Begin the game here.

puts "What is your name, hero"
hero_name = gets.chomp
player = Player.new(hero_name)

puts "The Monster truck approaches"
$monster_array[0].who_is_inside
puts "----------------------------------------"
$monster_array[0].on_board_roar

# Game loop, endless combat phase until the monsters are all dead or the player is defeated
while $monster_array.length > 0 && player.hp > 0 do
  $monster_array.each_with_index do |monster, index|
    sleep 0.25
    puts "Monster index: " + (index + 1).to_s
    monster.put_hp
  end
  player.report_hp
  puts "----------------------------------------"
  puts "which monster would you like to attack?"
  index = gets.chomp.to_i - 1


  if index > $monster_array.length - 1 || index < 0
    puts "please put a valid number in"
    next
  end

  player.attack $monster_array[index]
  sleep 0.25

  check_enemy_dead

  $monster_array.each_with_index do |monster, index|
    sleep 0.25
    monster.attack(player)
  end

  sleep 0.3
  puts
  puts "----------------------------------------"
  puts
end

if player.hp <= 0
  puts "You lose! Game over"
else
  puts "YOU'RE WINNER!"
end
