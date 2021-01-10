require 'mongo'

Mongo::Logger.logger = Logger.new('./logs/mongo.txt')

class DB_handling
  def remove_user(email)
=begin
  http://docs.mongodb.com/ruby-driver/current/quick-start/

  Make a Connection
  Use Mongo::Client to establish a connection to a running MongoDB instance.
  You can also use a URI connection string:
  variable = Mongo::Client.new(mongodb://>DB IP Addres</server-name)
=end
    client = Mongo::Client.new('mongodb://127.0.0.1:27017/rocklov')
=begin
  Access a Database and a Collection
  To access a collection, refer to it by name.
=end
    users = client[:users]
=begin
  Delete Documents
  Use the delete_one or delete_many methods to delete documents from a collection (either singly or several at once).
=end
    users.delete_many({email: email})
  end

  def get_user(email)
    client = Mongo::Client.new('mongodb://127.0.0.1:27017/rocklov')
    users = client[:users]
    user = users.find({email: email}).first
    return user[:_id]
  end

  def remove_equipo(user_email, announcement_name)
    user_id = get_user(user_email)
    client = Mongo::Client.new('mongodb://127.0.0.1:27017/rocklov')
    equipo = client[:equipos]
    equipo.delete_many({name: announcement_name, user: user_id})
  end
end
