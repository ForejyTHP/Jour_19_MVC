require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("db/gossip.csv", "a") do |csv|
        csv << [@author, @content]
      end
  end

  def self.recuperer_tout
    all_gossips = Array.new
    CSV.open("db/gossip.csv", "r").each do |ary|
      gossip_provisoire = Gossip.new(ary.first, ary.last)
      all_gossips << gossip_provisoire
    end
    return all_gossips
  end

  def self.recuperer_auteur(auteur)
    author_gossips = Array.new
    CSV.open("db/gossip.csv", "r").each do |ary|
      if ary.first == auteur
        gossip_provisoire = Gossip.new(ary.first, ary.last)
        author_gossips << gossip_provisoire
      end
    end
    return author_gossips
  end

  def self.recuper_avec_keyword(keyword)
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