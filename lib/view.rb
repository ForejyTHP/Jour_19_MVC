class View

  def create_gossip
    puts "Quel est l'auteur ?"
    var = gets.chomp
    puts "Quel est le contenu ?"
    var2 = gets.chomp
    return params = {author: var, content: var2}
  end

  def index_gossips(gossips)
    system("clear")
    puts ("AFFICHAGE DES POTINS\n\n")
    sleep(1)
    if gossips.nil?
      puts "Il n'y a pas de fichier a afficher.\n\n"
    else
      gossips.each { |gossip| puts "  #{gossip.author} : #{gossip.content}"}
      sleep(1)
      puts "\n\n"
    end
  end

  def print_header
    puts "
    ╔══════════╗      ╔═════════╗
    ║ Tu l'as  ║      ║Et nous, ║
    ║ vu, lui ?║      ║on s'est ║
    ╚══════════╝      ║regardé ?║
                      ╚═════════╝
"
  end

  def print_confirmation(gossip)
    system("clear")
    puts "#{gossip.author} : #{gossip.content}\nLe potin a bien ete cree.\n\n"
    sleep(1)
  end

  def print_message_for_delete_gossips
    system("clear")
    puts "Les potins ont tous ete supprimes.\n\n"
    sleep(1)
  end

  def print_message_for_delete_author(author)
    system("clear")
    author[0] =~ /[aeiouy]/i ? article = "d\'" : article = "de"
    puts "Tous les potins #{article} #{author} ont ete supprimes\n\n"
    sleep(1)
  end

  def print_message_for_delete_one_gossip(gossip_content)
    system("clear")
    puts "Le potin suivant a bien ete supprime : \"#{gossip_content}\"\n\n"
    sleep(1)
  end

  # def index_gossips_of_author(gossips, author)
  #   if (gossips.key?(author))
  #     p author
  #     gossips.each do |k, v|
  #       if k == author
  #         puts " : " + v
  #       end
  #     end
  #   end
  # end

  # def index_gossips_with_keywords(gossips, keyword)

  # end

end
