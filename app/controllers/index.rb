# before do
#   @current_user = nil;
# end

before '/sign_in' do
  @username = nil
end

get '/' do
  # Look in app/views/index.erb
  @current_user = nil;
  erb :index
end

get '/sign_in' do
  erb :sign_in
end

post '/sign_in' do
  @user = User.authenticate(params[:user][:username],params[:user][:password])
  if @user
    session[:user_id] = @user.id
    redirect '/list_surveys'
  else
    @error = 'Failed to authenticate'
    @username = params[:user][:username]
    erb :sign_in
  end 
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/list_surveys'
  else
    @error = 'You failed.'
    erb :sign_up
  end
end

get '/list_surveys' do 
  erb :list_surveys
end

get'/create_survey' do 
  erb :create_survey
end
