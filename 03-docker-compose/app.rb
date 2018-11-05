require 'sinatra'
require 'json'

# Server config

configure do
  set :bind, ENV['BIND_ADDRESS'] || 'localhost'
end

# Routes

get '/' do
  things = Thing.all
  erb :index, :locals => {things: things}
end

get '/new' do
  erb :new
end

post '/new' do
  begin
    name = params['thing_name']
    puts "creating thing #{name}"
    Thing.create(name: name)
    redirect to('/')
  rescue Exception => e
    status 400
    body e.message
  end
end

# get '/random' do
#
# end

# Models

require 'mongoid'

Mongoid.load!('config/mongoid.yml')

class Thing
  include Mongoid::Document
  field :name, type: String
end
