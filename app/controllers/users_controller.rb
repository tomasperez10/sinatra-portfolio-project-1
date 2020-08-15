class UserController < ApplicationController

  get '/' do
    erb :'/users/index'
  end

end
