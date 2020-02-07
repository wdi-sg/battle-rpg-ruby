names = [
    ["Dark", "Red", "Green", "Blue", "White", "Black", "Nasty", "Smelly", "Ugly", "Lonely"],
    ["Kobold", "Bandit", "Ogre", "Goblin", "Slime", "Golem", "Pony"]
]

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


monster = Monster.new( generate_name(names[0][rand(names[0].length)], names[1][rand(names[1].length)] ), rand(100), rand )


while monster.hp > 0 do
    puts "Monster : #{monster.name}"
    puts "Health : #{monster.hp}"
    puts "how much damage do you want to do?"
    input = gets.chomp
    monster.hp -= input.to_i
    puts "monster has damage: "+monster.hp.to_s
end

puts "done with game!"