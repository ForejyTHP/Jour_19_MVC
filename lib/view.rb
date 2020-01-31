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
    gossips.each { |gossip| puts gossip.author + " : " + gossip.content}
    sleep(1)
    puts "\n\n"
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
