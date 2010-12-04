require './server.rb'

module Const
  Irc_server = "irc.gamesurge.net"
  Irc_port = 6667
  Irc_vhost = nil # "zomgbbq.com"
  Irc_channel = "#tf2.pug.na.beta"
  
  Messenger_count = 2
  Nick_bot = "IRCCompanionBot"
  Nick_messenger = "IRCMessengerBot"

  Afk_threshold = 15 * 60
  Afk_delay = 45
  Server_delay = 60
  Picking_delay = 45
  Message_delay = 0.1

  Team_count = 2
  Team_names = [ "Red team", "Blue team" ]
  Team_colours = [ 4, 10 ]
  Team_size = 6
  Team_classes = { "scout" => 2, "soldier" => 2, "demo" => 1, "medic" => 1, "captain" => 1 }
  

  Dallas1 = Server.new("dallas1.tf2pug.eoreality.net", 27015, "tf2pug", "secret")
  Chicago1 = Server.new("chicago1.tf2pug.eoreality.net", 27015, "tf2pug", "secret")

  Servers = [ Chicago1, Dallas1 ]
  Maps = [ "cp_badlands", "cp_granary", "koth_viaduct", "cp_coldfront", "cp_freight_final1" ] # cp_gullywash_imp3

  Server_used = 8
  
  State_waiting = 0
  State_afk = 1
  State_delay = 2
  State_picking = 3
  State_server = 4
end

module Variables
  def setup
    @server = Const::Servers.first
    @map = Const::Maps.first
  
    @players = {}
    @spoken = {}
    @afk = []

    @captains = []
    @teams = []
    @lookup = {}

    @state = Const::State_waiting
    @pick = 0
  end
end