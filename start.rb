NAMES = [
    ["Dark", "Red", "Green", "Blue", "White", "Black", "Nasty", "Smelly", "Ugly", "Lonely", "Wretched", "Ruby", "Sickly", "Stubborn", "Unending"],
    ["Kobold", "Bandit", "Ogre", "Goblin", "Slime", "Golem", "Pony", "Troll", "Orc", "Error", "Syntax"]
]

MONSTERS = []
GRAVEYARD = []


class Monster

    attr_accessor :hp, :name, :strength

    def initialize (name, hp, strength)
        @name = name
        @hp = hp
        @strength = strength
    end

end

class Player
    attr_accessor :hp, :name

    def initialize ( hp, name )
        @hp = hp
        @name = name
    end


end

def generate_name (prefix, base)
    return prefix + " " + base
end





def create_mob ( number )
    for i in 1..number do
        MONSTERS.push( monster = Monster.new( generate_name(NAMES[0][rand(NAMES[0].length)], NAMES[1][rand(NAMES[1].length)] ), rand(25)+55, rand ))
    end
    puts MONSTERS
end




puts "Type number of monsters you wish to generate!"
input = gets.chomp
p input
create_mob input.to_i


while MONSTERS.length > 0 do
    while MONSTERS[0].hp > 0 do
        puts "Monster : #{MONSTERS[0].name}"
        puts "Health : #{MONSTERS[0].hp}"
        puts "how much damage do you want to do?"
        input = gets.chomp
        MONSTERS[0].hp -= input.to_i
        puts "monster has damage: "+MONSTERS[0].hp.to_s
    end
    GRAVEYARD.push MONSTERS.shift
end

puts "done with game!"