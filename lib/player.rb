class Player
  attr_accessor :name, :life_points
  
  def initialize(name)
    @name         = name
    @life_points  = 10
  end

  def show_state
    puts "#{self.name} a #{self.life_points} points de vie"
  end

  def gets_damage(dmg)
    @life_points = @life_points - dmg
    if @life_points <= 0
      @life_points = 0
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

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name         = name
    @life_points  = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{self.name} a #{self.life_points} points de vie et une arme de niveau #{self.weapon_level}"
  end
  
  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    lvl_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{lvl_weapon}"
    if lvl_weapon > @weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      @weapon_level = lvl_weapon
    else
      puts "Crotte elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    randomize_life = rand(1..6)
    if randomize_life == 1
      puts "Tu n'a rien trouvé"
    elsif randomize_life >= 2 && randomize_life <= 5
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points = @life_points + 50
      if @life_points > 100
        @life_points = 100
      end
    elsif randomize_life == 6
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      @life_points = @life_points + 80
      if @life_points > 100
        @life_points = 100
      end
    end
  end
end