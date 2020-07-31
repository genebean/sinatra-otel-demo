require 'sinatra/base'

class HelloWorld < Sinatra::Base
  get '/*' do
    out = "<h1>Hello world!</h1>" + "\n"

    #Sleep a random time between 2s and 5s
    sleeping_time = rand(4)+2
    sleep(sleeping_time)
    out += "<p>I slept for #{sleeping_time}s.</p>" + "\n"

    return out
  end

  run! if app_file == $0
end

