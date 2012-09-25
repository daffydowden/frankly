require 'sinatra/base'

class MyApp < Sinatra::Base
  require "sinatra/reloader" if development?

  configure :development do
    register Sinatra::Reloader
  end

  configure :production, :development do
    enable :logging
  end

  configure do
    set :views, settings.root + '/app/views'
  end

  before do
    cache_control :private, :must_revalidate, :max_age => 1
    last_modified Time.now
  end

  get '/' do
    haml :index
  end

end