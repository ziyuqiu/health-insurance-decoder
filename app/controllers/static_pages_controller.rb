class StaticPagesController < ApplicationController
  def emergency
  end
  def resources
		require 'rss'
		require 'open-uri'
		rss_results = []
		@rss = RSS::Parser.parse('http://www.trumba.com/calendars/brandeis-university-health.rss', false)
		print @rss
		@rss.items.each do |result|
		   	result = { title: result.title, link: result.link, description: result.description }
		    rss_results.push(result)
		end
	    @events = rss_results
	end
end
