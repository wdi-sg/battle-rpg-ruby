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
    @hp = 1000
  end

  def get_hp
    @hp
  end
  def set_hp(damage)
    @hp = @hp - damage
  end
  def damaged
     @hp = @hp - rand(1..100)
     puts "Player has damage :" + @hp.to_s
  end
end

class MonsterTruck
  attr_accessor :moster
  def initialize
    @monster = []
    @hp = 1000
  end

  def get_hp
    @hp
  end

  def set_hp(damage)
    @hp = @hp - damage
  end

  def set_monsters count
    count.times do
      @monster << Monster.new
    end
  end
  def get_monsters
    @monster
  end
  def remove_monsters index
    @monster.delete_at(index)
  end
  def total_monsters
    @monster.length
  end
end
class Truck_list
  def initialize trucks
    @trucks = trucks
    @defeated = false
  end
  def get_defeated
      undefeated_truck = @trucks.select {|t|
        t.get_hp > 0
      }.size
      if undefeated_truck == 0
        @defeated = true
      end
      @defeated
  end
end
player = Player.new
truck1 = MonsterTruck.new
truck2 = MonsterTruck.new
truck3 = MonsterTruck.new
# puts "how many monsters should be in the game?"
# monster_count = gets.chomp
trucks = [ truck1, truck2, truck3]
trucks.map do |t|
  t.set_monsters rand(1..5)
end
truck_list = Truck_list.new trucks
while trucks.length > 0 && player.get_hp > 0 do
  puts "Which truck do you want to attack?"
  trucks.map.with_index do |t, i|
    print "Truck #{i.to_s} "
  end
  print "?:"
  selected_truck = gets.chomp.to_i
  #If monster truck exist and has armor more than 0
  if trucks[selected_truck] && trucks[selected_truck].get_hp > 0
    puts "How much damage do you want to do to the monster truck?"
    truck_damage = gets.chomp.to_i
    trucks[selected_truck].set_hp truck_damage.to_i
    puts "monster truck damage: "+trucks[selected_truck].get_hp.to_s
    if trucks[selected_truck].get_hp<=0
      puts "You've defeated the monster truck"
    end
    if trucks.length > 0 && player.get_hp > 0
        player.damaged
    end
  #If monster truck armor less than or equals to 0
  elsif trucks[selected_truck] && trucks[selected_truck].get_hp <= 0
  puts "Which monster you want to attack?"
    trucks[selected_truck].get_monsters.map.with_index do |monster, i|
      print "Monster [#{i.to_s}] "
    end
    print "?:"
    index = gets.chomp.to_i
    if trucks[selected_truck].get_monsters[index]
      puts "how much damage do you want to do?"
      input = gets.chomp
      trucks[selected_truck].get_monsters[index].set_hp input.to_i
      puts "monster has damage: "+trucks[selected_truck].get_monsters[index].get_hp.to_s
      if trucks[selected_truck].get_monsters[index].get_hp<=0
         puts "You've defeated a monster"
         puts
         trucks[selected_truck].remove_monsters index
         if trucks[selected_truck].total_monsters == 0
            trucks.delete_at(selected_truck)
         end
      end
    if trucks.length > 0 && player.get_hp > 0
        player.damaged
    end
    else
      puts
      puts "Monster does not exist"
      puts
    end
  else
    puts
    puts "MonsterTruck does not exist"
    puts
  end
end
 if trucks.length <= 0
  puts "Defeated all monsters"
 else
    puts "Player ran out of health"
 end
puts "done with game!"