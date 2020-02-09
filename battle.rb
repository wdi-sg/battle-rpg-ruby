class Monster
    attr_accessor :index, :hp, :name

    def initialize (index, hp, name)
        @index = index
        @hp = hp
        @name = name
    end

  def get_hp
    @hp
  end

  def set_hp(damage)
    @hp = @hp - damage
  end


class Player
end

monster = [
    monster1 = Monster.new(1, 20, "🕷 Spido"),
    monster2 = Monster.new(2, 24, "🐍 Snakero"),
    monster3 = Monster.new(3, 35, "🐡 Puffo")
]
# puts monster1.name

selected_monster = 0
if (selected_monster == 0)
  puts "which monster do you want to attack?" 
  puts " ".ljust(3) + monster[0].index.to_s + " ".ljust(3) + monster[0].name + " ".ljust(7) + monster[0].hp.to_s + "HP"
  puts " ".ljust(3) + monster[1].index.to_s + " ".ljust(3) + monster[1].name + " ".ljust(4) + monster[1].hp.to_s + "HP"
  puts " ".ljust(3) + monster[2].index.to_s + " ".ljust(3) + monster[2].name + " ".ljust(6) + monster[2].hp.to_s + "HP"
  
  input = gets.chomp

    if (input == monster[0].index.to_s)
    puts "you're fighting " +  monster[0].name
        while (monster[0].hp > 0) do
            puts "how much damage do you want to do?"
            input = gets.chomp

            monster[0].set_hp input.to_i
            puts "monster has damage: " + monster[0].get_hp.to_s

            if (monster[0].get_hp <= 0)
            puts "done with game!"
            end
        end

    elsif (input == monster[1].index.to_s)
        puts "you're fighting " +  monster[1].name
        while (monster[1].hp > 0) do
            puts "how much damage do you want to do?"
            input = gets.chomp
        
            monster[1].set_hp input.to_i
            puts "monster has damage: " + monster[1].get_hp.to_s
        
            if (monster[1].get_hp <= 0)
            puts "done with game!"
            end
        end

    elsif input = monster[2].index.to_s
        puts "you're fighting " +  monster[2].name
        while (monster[2].hp > 0) do
            puts "how much damage do you want to do?"
            input = gets.chomp
        
            monster[2].set_hp input.to_i
            puts "monster has damage: " + monster[2].get_hp.to_s
        
            if (monster[2].get_hp <= 0)
            puts "done with game!"
            end
        end
    end 
end
end