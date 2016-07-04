all_urls = []

File.open("db/urls", "r+") do |x|
	x.each_line do |long_url|
		long_url.gsub!(",\n","")
		long_url.gsub!("(","")
	  long_url.gsub!(")","")
	  long_url.gsub!(",","")
	  long_url.gsub!(";","")

	  rnumbers = []
		8.times { rnumbers << rand(1..9) }
		short_url = rnumbers.join.to_i.to_s(36)

		data = "'#{long_url}','#{short_url}'"
		all_urls << data
	end
end

Url.transaction do
  all_urls.each do |data|
    Url.connection.execute "INSERT INTO urls (long_url, short_url) VALUES (#{data})"
  end
end