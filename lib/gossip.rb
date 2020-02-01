require 'csv'
#Le model est líntermediaire avec la base de donnees, c'est le model qui interagit avec la base de donnees et seulement le model.

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    if File.exists?("db/gossip.csv") == false
      CSV.open("db/gossip.csv", "a", headers:true) do |csv|
        csv << ["Author", "Content"]
      end
    end
    CSV.open("db/gossip.csv", "a", headers:true) do |csv|
        csv << [@author, @content]
      end
  end

  def self.recuperer_tout
    if File.exist?("db/gossip.csv")
      all_gossips = Array.new
      CSV.open("db/gossip.csv", "r").each do |ary|
        gossip_provisoire = Gossip.new(ary.first, ary.last)
        all_gossips << gossip_provisoire
      end
      return all_gossips
    end
  end

  def self.recuperer_auteur(auteur)
    if File.exist?("db/gossip.csv")
      author_gossips = Array.new
      CSV.open("db/gossip.csv", "r").each do |ary|
        if ary.first == auteur
          gossip_provisoire = Gossip.new(ary.first, ary.last)
          author_gossips << gossip_provisoire
        end
      end
      return author_gossips
    end
  end

  def self.recuperer_avec_keyword(keyword)
    if File.exist?("db/gossip.csv")
      keyword_gossips = Array.new
      CSV.open("db/gossip.csv", "r").each do |ary|
        if ary.last.include?(keyword)
          gossip_provisoire = Gossip.new(ary.first, ary.last)
          keyword_gossips << gossip_provisoire
        end
      end
      return keyword_gossips
    end
  end

  def self.delete_all
    if File.exist?("db/gossip.csv")
      File.delete("db/gossip.csv")
    end
  end

  def self.delete_gossips_of_author(author)
    if File.exist?("db/gossip.csv")
      csv = CSV.read("db/gossip.csv", headers:true)
      csv.delete_if do |row|
        row['Author'] == author
      end
      pp csv
      if csv.headers == []
        File.delete("db/gossip.csv")
      else
        File.open("db/gossip.csv", "w") do |f|
        f.write(csv)
        end
      end
    end
  end

  def self.delete_one_gossip(gossip_content)
    if File.exist?("db/gossip.csv")
      csv = CSV.read("db/gossip.csv", headers:true)
      csv.delete_if do |row|
        row['Content'] == gossip_content
      end
      if csv.headers == []
        File.delete("db/gossip.csv")
      else
        File.open("db/gossip.csv", "w") do |f|
          f.write(csv)
        end
      end
    end
  end
end
