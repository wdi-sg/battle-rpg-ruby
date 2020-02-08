class Monster
    attr_accessor :hp, :name

    def initialize (hp, name)
        @hp = hp
        @name = name
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

monster = [
    monster1 = Monster.new(20, "🕷 Spido"),
    monster2 = Monster.new(24, "🐍 Snakero"),
    monster3 = Monster.new(35, "🐡 Puffo")
]

# puts monster1.name

# while monster.get_hp > 0 do
#   puts "which monster do you want to attack?" 
#   input = gets.chomp
#   monster.set_monster input.to_i

#   puts "how much damage do you want to do?"
#   input = gets.chomp
#   monster.set_hp input.to_i

#   puts "monster has damage: " + monster.get_hp.to_s
# end

# puts "done with game!"