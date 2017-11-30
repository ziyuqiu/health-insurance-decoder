class StaticPagesController < ApplicationController
  def emergency
  end
  def resources
		require 'rss'
		require 'open-uri'
		rss_results = []
		@rss = RSS::Parser.parse('http://www.trumba.com/calendars/brandeis-university-health.rss', false)
		@rss.items.each do |result|
		   	result = { title: result.title, link: result.link, description: result.description, date: result.category }
		    rss_results.push(result)
		end
	    @events = rss_results
	end
end
