if development?
  require 'sinatra/reloader'
end

get '/' do
  haml :index
end

post '/' do
  md = RDiscount.new(params[:data])
  md.to_html
end
