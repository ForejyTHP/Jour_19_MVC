require_relative 'gossip.rb'
# require './model.rb'
require_relative 'view'


class Controller
  attr_accessor :gossip, :view

  def initialize
    @view = View.new
  end

  def create_gossip
    temp_hash = view.create_gossip
    gossip = Gossip.new(temp_hash[:author], temp_hash[:content])
    gossip.save
  end

  def index_gossips
    all_gossips = Gossip.recuperer_tout
    @view.index_gossips(all_gossips)
  end

  def index_gossips_of_author(author)
    all_gossips = Gossip.recuperer_auteur(author)
    @view.index_gossips(all_gossips)
  end

  def index_gossips_with_keywords(keyword)
    all_gossips = Gossip.recuper_avec_keyword(keyword)
    @view.index_gossips(all_gossips)
  end

  def delete_gossips

  end

  def delete_gossips_of_author

  end

  def delete_one_gossip

  end

  def print_header
    view.print_header
  end
end