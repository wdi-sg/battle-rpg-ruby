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

class Monster_Truck

    attr_accessor :name, :hp, :mobs

    def initialize (name, hp, mobs)
        @name = name
        @hp = hp
        @mobs = mobs
    end

end

class Player
    attr_accessor :hp, :name

    def initialize ( hp, name )
        @hp = hp
        @name = name
    end

end


def create_mob ( number )

    names = [
    ["Dark", "Red", "Green", "Blue", "White", "Black", "Nasty", "Smelly", "Ugly", "Lonely", "Wretched", "Ruby", "Sickly", "Stubborn", "Unending"],
    ["Kobold", "Bandit", "Ogre", "Goblin", "Slime", "Golem", "Pony", "Troll", "Orc", "Error", "Syntax"]
]
    def generate_name (prefix, base)
        return prefix + " " + base
    end

    for i in 1..number do
        MONSTERS.push( monster = Monster.new( generate_name(names[0][rand(names[0].length)], names[1][rand(names[1].length)] ), rand(55)+25, rand ))
    end

end




puts "Type number of monsters you wish to generate!"
mob_count = gets.chomp
create_mob mob_count.to_i
prefix = ["Monster", "Raggedy", "Nascar", "Hot Wheels", "Slightly-Used", "Bulletproof", "Squeaky", "Rusty", "Ninja" "Clown"]
truck_name = prefix[rand(prefix.length)] + " Monster Truck"
truck = Monster_Truck.new( truck_name, rand(55)+25, MONSTERS )


puts truck.name
puts truck.hp
puts truck.mobs



while MONSTERS.length > 0 do
    while MONSTERS[0].hp > 0 do
        puts "Monster : #{MONSTERS[0].name}"
        puts "Health : #{MONSTERS[0].hp}"
        puts "how much damage do you want to do?"
        input = gets.chomp
        puts "You deal " + input + " damage"
        MONSTERS[0].hp -= input.to_i
    end
    GRAVEYARD.push MONSTERS.shift
end

puts "done with game!"