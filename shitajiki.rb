if development?
  require 'sinatra/reloader'
end

get '/' do
  haml :index
end

post '/' do
  # 改行がエスケープされるので置換しておく
  data = params[:data].gsub('\\n', "\n")

  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true)
  html = markdown.render(data)

  # TODO: パラメーターでホストや、サイズやクラスなどを指定できるようにする
  Emoji.convert(html)
end
