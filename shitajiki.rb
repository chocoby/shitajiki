if development?
  require 'sinatra/reloader'
end

get '/' do
  haml :index
end

post '/' do
  # TODO: パラメーターでホストや、サイズやクラスなどを指定できるようにする
  markdown = RDiscount.new(params[:data])
  html = markdown.to_html
  Emoji.convert(html)
end
