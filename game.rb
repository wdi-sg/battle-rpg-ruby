class Monster
  # attr_accessor :name, :hp

  def initialize (name, hp)
      @name = name
      @hp = hp
  end

  def get_hp
      @hp
  end

  def set_hp(damage)
    @hp = @hp - damage

  end

  def get_name
   @name 
   end

   def set_name (name) 
   @name = name
   end 

  end


 
monsters = []
 i = 0

puts "how many monsters should be in the game?"
monster_count = gets.chomp.to_i
while i < monster_count do 
  # puts i
  monsters.push(Monster.new("monster"+i.to_s,10))
    i += 1 
  end


    monsters.each_with_index do |monster, index|
      # while monster.get_hp > 0 do 
      monster_id = ""
      monsters.each_with_index do |monster, index|
        if monster.get_hp > 0
          monster_id = monster_id + index.to_s + ", "
        end
      end
      
        monster_id = monster_id[0...-2]
        # removes the last 2 characters from the string
      puts "which monster do you want to fight? Pick from the following options: "+ monster_id
      input_monster = gets.chomp.to_i
      while monsters[input_monster].get_hp > 0 do 
        puts "how much damage do you want to do?"
          damage = gets.chomp
          monsters[input_monster].set_hp(damage.to_i) 
          puts "monster has damage: "+damage
          puts "Monster has remaining hp:" +monsters[input_monster].get_hp.to_s
       end

  
  end
puts "done with game!"
