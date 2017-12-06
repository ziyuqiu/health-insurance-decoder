class EventJob
	include SuckerPunch::Job
	workers 5

	def perform(event)
		puts "===========================EVENTS UPDATING============================"
		puts event
		ActiveRecord::Base.connection_pool.with_connection do
		require 'rss'
		require 'open-uri'
		@rss = RSS::Parser.parse('http://www.trumba.com/calendars/brandeis-university-health.rss', false)
		
			@rss.items.each do |result|
			   	result = Event.create(  :title => result.title, 
			   				:link => result.link, 
			   				:category => result.category,
			   				:description => result.description.split("<br/>")[2],
			   				:date => result.description.split("<br/>").first,
			   				:weekday => result.description.split("<br/>").first.split(",").first,
			   				:date => result.description.split("<br/>").first.split(",")[1..2].join,
			   				:time => result.description.split("<br/>").first.split(",").last,
			   				:location => result.description.split("<br/>",2).last.split("<br/>",2).last.split("<br/>",2).last.split("<br/>",2).last.split("<br/>",2).first.split(":",2).last,
			   				:other => result.description.split("<br/>",2).last.split("<br/>",2).last.split("<br/>",2).last.split("<br/>",2).last.split("<br/>",2).last
			   			)
			   	puts result
			end
		end
	end
end

EventJob.perform_async("hiiiiiiii")

