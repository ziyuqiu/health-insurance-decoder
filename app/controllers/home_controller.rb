class HomeController < ApplicationController
  def index
    if current_user
      @user = User.find(current_user.id)
      @logs = Log.all
      @log = Log.new
      @symptoms = Symptom.all
      if current_user != nil
        @results = @logs.where(:user_id => current_user.id, :visit_id => -1)
      end
      if !params[:symptom_name].nil?
        @results = Log.joins(:symptom).where(:symptoms => {:name => params[:symptom_name]})
      end
    end

    require 'rss'
    require 'open-uri'
    rss_results = []
    @rss = RSS::Parser.parse('http://www.trumba.com/calendars/brandeis-university-health.rss', false).items[0..2]
    @rss.each do |result|
      result = {  title: result.title,
                  link: result.link,
                  category: result.category,
                  description: result.description.split("<br/>")[2],
                  date: result.description.split("<br/>").first,
                  weekday: result.description.split("<br/>").first.split(",").first,
                  date: result.description.split("<br/>").first.split(",")[1..2].join,
                  time: result.description.split("<br/>").first.split(",").last,
                  location: result.description.split("<br/>",2).last.split("<br/>",2).last.split("<br/>",2).last.split("<br/>",2).last.split("<br/>",2).first.split(":",2).last,
                  other: result.description.split("<br/>",2).last.split("<br/>",2).last.split("<br/>",2).last.split("<br/>",2).last.split("<br/>",2).last
               }
      rss_results.push(result)
    end
    @events = rss_results
  end

  def load_login
    respond_to do |format|
      format.js
    end    
  end
end
