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






def check_if_at_least_one_dead(monsters)
  at_least_one_dead = false

  for i in 0...monsters.length do
    if monsters[i].get_hp < 0 
      at_least_one_dead = true
    end 
  end

  return at_least_one_dead
end



puts "How many monsters do you want to fight"
monster_count = gets.chomp


monsters = Array.new(monster_count.to_i,nil)

for x in 0..monsters.length do
  monsters[x] = Monster.new
end

while check_if_at_least_one_dead(monsters) == false do
  

  puts "Which monster do you want to attack?"
  monster_to_attack = gets.chomp
  monster_to_attack_int = (monster_to_attack.to_i - 1)
  
  puts "how much damage do you want to do?"
  input = gets.chomp

  puts monster_to_attack_int
  puts monsters[monster_to_attack_int]

  monsters[monster_to_attack_int].set_hp input.to_i

  puts "Showing monster HP..."
  
  for c in 0...monsters.length do
    puts "Monster#{c + 1} HP = #{monsters[c].get_hp}"   
  end

end

puts "done with game!"

