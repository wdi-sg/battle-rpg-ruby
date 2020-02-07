# battle-rpg-ruby


We'll create a turn based game that kills enemies.


game.rb

```ruby
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
end

monster = Monster.new


while monster.get_hp > 0 do
  puts "how much damage do you want to do?"
  input = gets.chomp
  monster.set_hp input.to_i
  puts "monster has damage: "+monster.get_hp.to_s
end

puts "done with game!"
```

Run this code. It damages the monster / enemy for each "turn".

##### Part 2

Create an array that contains multiple monsters for the player to fight:

```
monster1 = Monster.new
monster2 = Monster.new
monster3 = Monster.new
```

Ask the player which monster they want to attack at the beginning of the turn. (add the prompt into the loop)

This improves the game by making multiple monsters.

##### Part 3

At the beggining of the game ask the player how many monsters they would like to fight:
```
puts "how many monsters should be in the game?"
monster_count = gets.chomp
```

Use a loop to fill a dynamic number of monsters into the array before the game starts, using the `monster_count` variable.

##### further
You can currently just keep attacking all the monsters no matter the hit points they have left. (i.e., if the HP is zero or below)

Add logic to take the monster out of the array if it's HP is 0 or below.

##### further
Change the loop logic so that the game ends when all the monsters are dead.


##### further
Add a monster truck to the game.

This is a truck that carries all the monsters.

The truck has armor that has hit points as well.

As long as the truck armor is more than 0, the player's attacks affect the truck first.

Hint: the truck is a new class that can contain monster class instances and has HP.

You can write a method inside the truck class that creates the monsters inside of it.

##### further
Display our the complete state of the game for each turn.

##### further
Give the player hit points.

After the player's attack on the monster, that monster gets to attack the player, unless the player killed the monster.

End the game if either the player kills all the monsters or they die.

##### further
Create a variable number of trucks at the beggining of the game, each with a random number of monsters inside.

##### further
The user will travel through rooms.

Create a `Room` class.

The user travels from room to room. The order of the rooms is given by an array of rooms. Each room has it's own array of monsters.

##### further

Room instances are connected in directions.

Draw out the configuration of the rooms:

```

RA - RB - RD
      |
     RC - RE
```

You can represent this like so:

```ruby
class Room
  def set_left_room( room )
    @left_room = room
  end
  
  def set_right_room( room )
    @right_room = room
  end
  
  # ... set_top_room ... etc   
end
```

Set the directions the player can travel.

```ruby
roomA = Room.new
roomB = Room.new
roomC = Room.new
roomD = Room.new
# ... etc
roomA.set_left_room( roomB )
roomB.set_right_room( roomA )
```

##### further
Add descriptions for each room. You can place items and other enhancements in the rooms like powerups or weapons.
