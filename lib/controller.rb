require_relative 'gossip.rb'
# require './model.rb'
require_relative 'view'

#il interprète et « contrôle » les données venant de l’utilisateur, comme des données venant d’un formulaire ou bien simplement une action faite via une URL.


class Controller
  attr_accessor :gossip, :view

  def initialize
    @view = View.new
  end

  def create_gossip
    temp_hash = view.create_gossip
    @gossip = Gossip.new(temp_hash[:author], temp_hash[:content])
    @gossip.save
    view.print_confirmation(@gossip)
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
    all_gossips = Gossip.recuperer_avec_keyword(keyword)
    @view.index_gossips(all_gossips)
  end

  def delete_gossips
    all_gossips = Gossip.delete_all
    @view.print_message_for_delete_gossips
  end

  def delete_gossips_of_author(author)
    all_gossips = Gossip.delete_gossips_of_author(author)
    @view.print_message_for_delete_author(author)
  end

  def delete_one_gossip(gossip_content)
    all_gossips = Gossip.delete_one_gossip(gossip_content)
    @view.print_message_for_delete_one_gossip(gossip_content)
  end

  def print_header
    @view.print_header
  end
end