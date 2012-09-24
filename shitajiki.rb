if development?
  require 'sinatra/reloader'
end

get '/' do
  haml :index
end

post '/' do
  # TODO: パラメーターでホストや、サイズやクラスなどを指定できるようにする
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
  html = markdown.render(params[:data])
  Emoji.convert(html)
end
