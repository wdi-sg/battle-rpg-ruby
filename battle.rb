class Monster
    attr_accessor :hp, :name

    def initialize
        @hp = 10
        @name = "frank"
      end

  def get_hp
    @hp
  end

#   def monster(hp, name)
#     @hp = hp
#     @name = name
#   end

  def set_hp(damage)
    @hp = @hp - damage
  end
end

class Player
end

monster = Monster.new
# monster = [
#     monster1 = Monster.new(:hp => "20", :name => "🕷 Spidooo"),
#     monster2 = Monster.new(:hp => "10", :name => "🐍 Snakerooo"),
#     monster3 = Monster.new(:hp => "35", :name => "🐡 Puffooo")
# ]

while monster.get_hp > 0 do
#   puts "which monster do you want to attack?"
  puts "how much damage do you want to do?"
  input = gets.chomp
  monster.set_hp input.to_i
  puts "monster has damage: " + monster.get_hp.to_s
end

puts "done with game!"