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

class TruckExample
  # Instance can still be created without initialize
  attr_accessor(:name,:monsters,:hp) 
end

class Truck
  def initialize(no_of_monsters,hp)
    monster_array = Array.new(no_of_monsters.to_i,nil)
    for i in 0...monster_array.length do
      monster_array[i] = Monster.new
    end
    @monsters = monster_array
    @hp = hp 
  end

  attr_accessor(:monsters,:hp)

  def set_hp(damage)
    @hp = @hp - damage
  end

end




####################################################
def check_if_all_are_dead(monsters)
  all_dead = true

  for i in 0...monsters.length do
    if monsters[i] != nil
      all_dead = false
    end 
  end

  return all_dead
end

def remove_dead_monsters(monsters)

  for i in 0...monsters.length do
    if monsters[i] == nil
      next
    elsif monsters[i].get_hp < 1
      puts "Monster#{i + 1} is dead!" 
      monsters[i] = nil
    end
  end

end

puts "How many monsters do you want to fight"
monster_count = gets.chomp

truck = Truck.new(monster_count.to_i, 10)













while check_if_all_are_dead(truck.monsters) == false do
  
  puts "Which monster do you want to attack?"
  monster_to_attack = gets.chomp
  monster_to_attack_int = (monster_to_attack.to_i - 1)
  
  puts "how much damage do you want to do?"
  input = gets.chomp


  if truck.hp > 1
    truck.set_hp input.to_i
  else
    #Subtract HP from chosen monster's health
    truck.monsters[monster_to_attack_int].set_hp input.to_i
    remove_dead_monsters(truck.monsters)
  end

  #Formatting
  puts " "  
  puts " "

  puts "Displaying game stats..."

  #Display Game Stats

  puts " "  
  puts " "

  #Display Truck Hp 

  if truck.hp > 0
    puts "You have not defeated the truck! "
    puts "Attacking truck for #{input} damage"
    puts "Truck HP is now #{truck.hp}"
  else
    puts "Truck has been taken down! Damaging Monsters ..."
  end

  puts " "  
  puts " "

  #Display Monsters HP
  puts "Showing monster HP..."  
  for c in 0...truck.monsters.length do
    if truck.monsters[c] == nil
      puts "Monster#{c + 1} is dead!"
    else
      puts "Monster#{c + 1} HP = #{truck.monsters[c].get_hp}"
    end  
  end

end

puts "done with game!"

