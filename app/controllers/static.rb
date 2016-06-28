get '/' do
	@urls = Url.where(long_url: params[:long_url])
  erb :"static/index"
	
end

post '/form' do
	@urls = Url.where(long_url: params[:long_url])
	url = Url.create(long_url: params[:long_url])
	erb :"static/index"
end

get '/:short_url' do
	@url = Url.find_by(short_url: params[:short_url])
	redirect @url.long_url
end

