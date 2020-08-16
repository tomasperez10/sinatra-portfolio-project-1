class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    enable :sessions unless test?
    set :session_secret, "secret"
    set :views, Proc.new { File.join(root, "../views/") }
  end
end
