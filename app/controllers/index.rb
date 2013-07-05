before do
  @current_user = nil;
end

get '/' do
  # Look in app/views/index.erb
  @current_user = nil;
  erb :index
end

get '/sign_in' do
  @user = User.authenticate(params)
  if @user.id
    redirect '/'
  else
    erb :sign_in
  end 

  @user = User.find_or_initialize_by_username(params[:user][:username])
  @email = 'an-email but not really;d'
end

get '/sign_up' do
  # @user = {}
  erb :sign_up
end

get '/list_surveys' do 
  erb :list_surveys
end

get'/create_survey' do 
  erb :create_survey
end
