get '/' do
  erb :"static/index"
end

post '/urls' do
	if Url.exists?(long_url: params[:long_url])
		@url = Url.find_by(long_url: params[:long_url])
		return @url.to_json
	else
		@url = Url.new(long_url: params[:long_url])
		@url.shorten
		if @url.save
			return @url.to_json
		else
		 	@errors = {errors: @url.errors}
    	return @errors.to_json
		end
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

