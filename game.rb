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

# The monster truck carries monsters
class MonsterTruck < Monster

  def initialize(monster_array, name)
    super(name)
    @monster_array = monster_array
    @hp = 20
  end

  def how_many_inside
    @monster_array.length
  end

  def set_hp(damage)
    @hp = @hp - damage
    if @hp <= 0
      destroy_truck
    end
  end

  def on_board_roar
    @monster_array.each do |monster|
      monster.roar
    end
  end

  def destroy_truck
    puts "the monster truck has been destroyed!"
    puts "The other monsters come out of the truck and start fighting!"
    @monster_array.each do |monster|
      $monster_array << monster
    end
  end

end

class Player

end


$monster_array = [MonsterTruck.new([Monster.new, Monster.new, Monster.new], "Monster Truck")]

# puts "How many monsters would you like to fight?"
# input_number = gets.chomp.to_i
# for i in 1..input_number do
#   $monster_array << Monster.new
# end

puts "The Monster truck approaches"
$monster_array[0].on_board_roar

while $monster_array.length > 0 do
  $monster_array.each_with_index do |monster, index|
    puts "Monster index: " + index.to_s
    monster.put_hp
  end

  puts "which monster would you like to attack?"
  index = gets.chomp.to_i
  puts "how much damage do you want to do?"
  input = gets.chomp.to_i

  if index > $monster_array.length - 1
    next
  end

  $monster_array[index].set_hp input
  $monster_array.each_with_index do |monster, index|
    if monster.get_hp <= 0
      puts monster.get_name + " has been defeated!"
      $monster_array.delete_at index
    end
  end

end

puts "done with game!"
