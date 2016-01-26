# Homepage (Root path)

enable :sessions

helpers do
  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in
    if current_user
      current_user.username
    else
      "No User"
    end
  end
end

get '/' do
  erb :index
end

get '/music' do
  @musics = Music.all
  erb :'music/index'
end

get '/music/new' do
   @musics = Music.new
   current_user
  erb :'music/new'
end

post '/music' do
  @musics = Music.new(
    title: params[:title],
    author:  params[:author],
    url:  params[:url],
    user: current_user ## This does make sense, find foreign key and puts it there.
  )
  if @musics.save
    redirect '/music'
  else
    erb :'music/new'
  end
end

get '/login' do
  erb :'login/login'
end

post '/login' do
  username = params[:username]
  password = params[:password]
  user = User.where(username: username, password: password).first
  if user
    session[:user] = user.username
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/signup' do
  @users = User.new(username: params[:username], email: params[:email], password: params[:password])
  if @users.save
    session[:user_id] = @users.id
    redirect '/'
  else
    redirect '/signup'
  end

  
end
