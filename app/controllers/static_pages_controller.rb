class StaticPagesController < ApplicationController
  	def emergency
  	end
 	def resources
		@events = Event.all
	end
end
