class Monster
    def initialize(name,hp)
      @name = name
      @hp = hp
    end

    def name
        @name
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

    puts "how many monsters should be in the game?"
  monster_count = gets.chomp.to_i
  (0...monster_count).each do |index|
    monsters.push(Monster.new)
    puts "index" + index.to_s
    puts "monsters hash" + monsters.to_s
  end
  
  monster = Monster.new("tommy",10)
  monster2 = Monster.new("drake",20)
  monster3 = Monster.new("donald",30)

  monster_selection = [monster,monster2,monster3]

  puts "which monster do you want? 1, 2, 3"

  monster_choice = gets.chomp

  puts monster_choice

  puts monster_selection[monster_choice.to_i]

  while   monster_selection[monster_choice.to_i].get_hp > 0 do
    puts "how much damage do you want to do?"
    input = gets.chomp
    monster_selection[monster_choice.to_i].set_hp input.to_i
    puts  monster_selection[monster_choice.to_i].name.to_s + " has damage: "+  monster_selection[monster_choice.to_i].get_hp.to_s
  end
  
  puts "done with game!"