module UrlsHelper
	def env(url)
		if self.request.env['HTTP_USER_AGENT'].downcase.match(/mac/i)
		    @mac = url.mac + 1
		    url.update(:mac => @mac)
		  elsif self.request.env['HTTP_USER_AGENT'].downcase.match(/windows/i)
		    @windows = url.windows + 1
		    url.update(:windows => @windows)
		  elsif self.request.env['HTTP_USER_AGENT'].downcase.match(/linux/i)
		    @linux = url.linux + 1
		    url.update(:linux => @linux)
		  elsif self.request.env['HTTP_USER_AGENT'].downcase.match(/unix/i)
		    @unix = url.unix + 1
		    url.update(:unix => @unix)
		  else
		    @other = url.other + 1
		    url.update(:other => @other)
		  end
	end

	def click_count(url)
		@clicks = url.clicks + 1
		url.update(:clicks => @clicks)
	end
end
