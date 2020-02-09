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

monsters = Array.new(monster_count.to_i,nil)

# .. means up to and equal, ... means not equal 
for x in 0...monsters.length do
  monsters[x] = Monster.new
end

while check_if_all_are_dead(monsters) == false do
  
  puts "Which monster do you want to attack?"
  monster_to_attack = gets.chomp
  monster_to_attack_int = (monster_to_attack.to_i - 1)
  
  puts "how much damage do you want to do?"
  input = gets.chomp

  #Subtract HP from chosen monster's health
  monsters[monster_to_attack_int].set_hp input.to_i

  remove_dead_monsters(monsters)

  #Display Monsters HP
  puts "Showing monster HP..."  
  for c in 0...monsters.length do
    if monsters[c] == nil
      puts "Monster#{c + 1} is dead!"
    else
      puts "Monster#{c + 1} HP = #{monsters[c].get_hp}"
    end  
  end

end

puts "done with game!"

