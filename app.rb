require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josianne")
player2 = Player.new("José")

puts "A ma gauche ........ #{player1.name}"
puts "A ma droite ........ #{player2.name}"
puts ""
while player1.life_points > 0 && player2.life_points > 0
  puts "Voici l'état de chaque joueur :"
  puts "#{player1.name} avec #{player1.life_points}"
  puts "#{player2.name} avec #{player2.life_points}"
  puts ""
  puts "#*#*#*#*#*#*#*FIGHT*#*#*#*#*#*#*#"
  puts "Au tour de Josianne"
  player1.attacks(player2)
  if player2.life_points <= 0 
    break
  end
  puts "Au tour de José"
  player2.attacks(player1)
  puts ""
end

binding.pry