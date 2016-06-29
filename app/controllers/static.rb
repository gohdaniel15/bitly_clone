get '/' do
	@urls = Url.where(long_url: params[:long_url])
  erb :"static/index"
end

post '/form' do
	@urls = Url.where(long_url: params[:long_url])
	@url = Url.new(long_url: params[:long_url], count: 0)
	@url.shorten
		if @url.save
			erb :"static/index"
		else
			@message = @url.errors.messages[:long_url].pop
			erb :"static/error"
		end
end

get '/error' do
	erb :"static/error"
end

get '/:short_url' do
	@url = Url.find_by(short_url: params[:short_url])
	@url.count = @url.count + 1
	@url.save
	redirect @url.long_url
end

