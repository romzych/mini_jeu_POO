require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"
bots_array = []
name = gets.chomp
human_player1 = HumanPlayer.new("#{name}")
player1       = Player.new("Josianne")
player2       = Player.new("José")

bots_array << player1
bots_array << player2

while human_player1.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)

  human_player1.show_state

  puts ""
  puts "Quelle action veux-tu effectuer ?"
  puts ""
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts ""
  puts "attaquer un joueur en vue :"
  puts "0 - Josiane a #{player1.life_points} points de vie"
  puts "1 - José a #{player2.life_points} points de vie"
  choose_input = gets.chomp
  if choose_input == "a"
    
    human_player1.search_weapon
  elsif choose_input == "s"
    human_player1.search_health_pack
  elsif choose_input == "0"
    human_player1.attacks(player1)
  elsif choose_input == "1"
    human_player1.attacks(player2)
  end
  if human_player1.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    puts ""
    puts "Touts les joueurs t'attaque"
  end
  bots_array.each do |perso|
    if perso.life_points <= 0
      break
    end
    perso.attacks(human_player1)
    if human_player1.life_points <= 0
      break
    end
  end 
end
puts ""
puts "La partie est finie"
if human_player1.life_points == 0
  puts "Loser ! Tu as perdu !"
else
  puts "BRAVO ! TU AS GAGNE !"
end


binding.pry