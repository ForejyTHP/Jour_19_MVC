require_relative 'controller'
#Le router sert díntermediaire entre l'user et le controlleur, en fonction de la requete il choisira le bon controleur ou la bonne methode d'un controlleur.
#En fait le router, c'est le cerveau du controlleur, le controlleur ne sait pas ce qu'il sait faire, mais il sait le faire, et c'est donc le router qui lui dit quoi faire
#Metaphore : Coach et sportif

class Router
  attr_accessor :controller

  def initialize
    @controller = Controller.new
  end

  def perform
    system("clear")
    puts "BIENVENUE DANS THE GOSSIP PROJECT"
    @controller.print_header
    while true
      menu = "
      1. Cree un potin
      2. Afficher tous les potins
        21. Afficher tous les potins d'un auteur
        22. Afficher tous les potins contenant un mot-cle
      3. Supprimer tous les potins?
          31. Supprimer tous les potins d'un auteur
          32. Supprimer un potin specifique
      4. Quitter le programme"
      puts "Que souhaitez vous faire ?\n#{menu}"

      params = gets.chomp.to_i

      case params
      when 1
        puts "Tu as choisi de creer un potin."
        @controller.create_gossip
      when 2
        puts "Tu as choisi d'afficher tous les potins."
        @controller.index_gossips
      when 21
        puts "De quel auteur voudrais-tu afficher les potins ?"
        @controller.index_gossips_of_author(gets.chomp)
      when 22
        puts "Quel mot-cle doivent contenir les potins a afficher ?"
        @controller.index_gossips_with_keywords(gets.chomp)
      when 3
        puts "Tu as choisi de supprimer tous les potins."
        @controller.delete_gossips  
      when 31
        puts "De quel auteur souhaites-tu supprimer les potins ?"
        @controller.delete_gossips_of_author(gets.chomp)
      when 32
        puts "Tu as choisi de supprimer un potin.\n
        Recopie bien le potin, sans erreur."
        @controller.delete_one_gossip(gets.chomp)
      when 4
        puts "A bientot !"
        sleep(1)
        system("clear")
        break
      else
        puts "Ce choix n'existe pas, merci de reassayer."
        sleep(1)
      end
    end
  end
end


#Pourquoi faire une seule methode qui 1. recupere le choix et 2. reagit au choix, au lieu de faire 2 methodes ?
#Contre : faire 2 methodes demande de stocker le resultat de methode 1. pour l'utiliser dans methode 2.
#Pour : Plus de methodes, plus de lisibilite et de maintenabilite
