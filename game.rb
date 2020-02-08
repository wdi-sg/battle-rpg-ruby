class Monster
  # attr_accessor :name, :hp

  def initialize (name, hp)
      @name = name
      @hp = hp
  end

  def get_hp
      @hp
      @monsters.each do |monster|
       puts monsters.get_hp
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

  monsters = [
  Monster.new('monster1',10),
  Monster.new('monster2',15),
  Monster.new('monster3',20)
  ]
 

    monsters.each_with_index do |monster, index|
      while monster.get_hp > 0
      puts "which monster do you want to fight? monster1, monster2, or monster3?"
      input_monster = gets.chomp.to_i
  # result = monsters.find {|name| name.include?(input)}
    # puts result
      end
 

  puts "how much damage do you want to do?"
  damage = gets.chomp
  # monsters[input_monster].set_hp damage.to_i
  # result.find {|hp| hp == input} 
   puts "monster has damage: "+damage
  end
puts "done with game!"
end
