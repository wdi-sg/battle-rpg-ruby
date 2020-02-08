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

class Truck
  def initialize(hp)
    @hp = hp
    @monsters = []
  end

  def get_hp
    @hp
  end

  def set_hp(damage)
    @hp = @hp - damage
  end

  def make_monsters
    ran_num = rand(2..7)
    while @monsters.length < ran_num
    @monsters.push(Monster.new)
  end

  def truck_monsters
    @monsters
  end
end
end

class Player
end

trucks = []

puts "How many trucks do you wanna create?"
num_of_trucks = gets.chomp.to_i
puts "How much HP should each truck have?"
truckHP = gets.chomp.to_i
while num_of_trucks > trucks.length
  trucks.push(Truck.new(truckHP))
end

puts trucks.length

trucks.each do |truck|
  truck.make_monsters
end

while trucks.length > 0 
  trucks.each_with_index do |truck, truck_index|
    puts "How much damage do you want to do to truck #{truck_index}?"
    chosen_truck = gets.chomp.to_i
    truck.set_hp(chosen_truck)
    if truck.get_hp <= 0
      puts "Truck destroyed! Monsters in truck: #{truck.truck_monsters.length}"
      while truck.truck_monsters.length > 0
        truck.truck_monsters.each_with_index do |monster, monster_index|
          while monster.get_hp > 0
            puts "Which monster do you want to attack?"
            chosen_monster_index = gets.chomp.to_i
            chosen_monster = truck.truck_monsters[chosen_monster_index]
            puts "How much damage do you want to do?"
            damage = gets.chomp.to_i
            chosen_monster.set_hp(damage)
              if chosen_monster.get_hp > 0 
                puts "Did #{damage} damage to monster #{chosen_monster_index}!"
              else
                puts "Killed monster #{chosen_monster_index}!"
                truck.truck_monsters.delete_at(chosen_monster_index)
                puts "Remaining monsters: #{truck.truck_monsters.length}"
                if truck.truck_monsters.length == 0
                  trucks.delete_at(truck_index)
                  puts "Truck #{truck_index} was deleted! Remaining trucks: #{trucks.length}"
                end
             end
          end
        end
      end
    end
  end
end

# while truck.get_hp > 0
#   puts "How much damage do you wanna do to the truck?"
#   truck_damage = gets.chomp.to_i
#   truck.set_hp(truck_damage)
#     if truck.get_hp <= 0
#       puts "Truck destroyed!"
#     else
#       puts "The truck took " + truck_damage.to_s + "! Remaining HP:" + truck.get_hp.to_s
#     end
# end

# while truck.truck_monsters.length > 0
#   truck.truck_monsters.each_with_index do |monster, index|
#     while monster.get_hp > 0
#       puts "Which monster do you wanna attack?"
#       chosen_monster = gets.chomp.to_i
#       puts "How much damage do you wanna do?"
#       damage = gets.chomp.to_i
#       truck.truck_monsters[chosen_monster].set_hp damage
#       if truck.truck_monsters[chosen_monster].get_hp <= 0
#         puts "You killed monster #{chosen_monster}!"
#         truck.truck_monsters.delete_at(chosen_monster)
#         puts "Remaining monsters: #{truck.truck_monsters.length}"
#       else 
#         puts "You did #{damage} damage to monster #{chosen_monster}!"
#       end
#       truck.truck_monsters.each_with_index do |monster, index|
#       puts "Monster #{index}: Remaining hp: #{monster.get_hp}"
#       end
#     end
#   end
# end

# while monster.get_hp > 0 do
#   puts "how much damage do you want to do?"
#   input = gets.chomp
#   monster.set_hp input.to_i
#   puts "monster has damage: "+monster.get_hp.to_s
# end
puts "Game over!"