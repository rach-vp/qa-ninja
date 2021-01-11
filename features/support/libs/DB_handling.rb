require 'mongo'

Mongo::Logger.logger = Logger.new('./logs/mongo.txt')

class DB_handling
  attr_accessor :users, :equipos

  def initialize
    client = Mongo::Client.new('mongodb://127.0.0.1:27017/rocklov')
    @users = client[:users]
    @equipos = client[:equipos]
  end

  def remove_user(email)
    @users.delete_many({email: email})
  end

  def get_user(email)
    user = @users.find({email: email}).first
    return user[:_id]
  end

  def remove_equipo(user_email, announcement_name)
    user_id = get_user(user_email)
    @equipos.delete_many({name: announcement_name, user: user_id})
  end
end
