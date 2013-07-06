# before do
#   @current_user = nil;
# end

before '/sign_in' do
  @username = nil
end

get '/' do
  if current_user
    redirect '/list_surveys'
  else
    redirect '/sign_in'
  end
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

get'/surveys/new' do
  @survey = Survey.new
  erb :create_survey
end

get'/survey/:survey_id' do 
  @survey = Survey.find(params[:survey_id])
  erb :take_survey
end

post '/responses' do 
  p params
  p current_user
  params.each do |question, answer|
    Response.create(:user_id => current_user.id, :option_id => answer)
  end
  redirect 'list_surveys'
end
