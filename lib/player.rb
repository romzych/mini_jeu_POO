class Player
  attr_accessor :name, :life_points
  
  def initialize(name, life_points = 10)
    @name = name
    @life_points = life_points
  end

  def show_state
    puts "#{self.name} a #{self.life_points} points de vie"
  end

  def gets_damage(dmg)
    self.life_points = self.life_points - dmg
    if self.life_points <= 0
      self.life_points = 0
      puts "le joueur #{self.name} a été tué !"
    end
  end

  def attacks(player)
    puts "le jouer #{self.name} attaque le joueur #{player.name}"
    dmg = compute_damage
    puts "il lui inflige #{dmg} points de dommages"
    player.gets_damage(dmg)

  end

  def compute_damage
    return rand(1..6)
  end
end