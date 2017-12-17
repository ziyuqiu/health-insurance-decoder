class LogsController < ApplicationController
  before_action :set_log, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js, :json

  # GET /logs
  # GET /logs.json
  def index
    $flag = 1 # redirect to logs page on user login
    @logs = Log.all
    @log = Log.new
    @symptoms = Symptom.all
    if current_user != nil
      @results = @logs.where(:user_id => current_user.id, :visit_id => -1)
    end
    if !params[:symptom_name].nil?
      @results = Log.joins(:symptom).where(:symptoms => {:name => params[:symptom_name]})
    end

    @visit = Visit.new
    @visits = Visit.all.order(:time)
    if not @visits_today.nil?
      @visits_today = @visit.where(:date => Date.today)
    end
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
  end

  # GET /logs/new
  def new
    @log = Log.new
    @symptoms = Symptom.all
  end

  # GET /logs/1/edit
  def edit
  end

  # POST /logs
  # POST /logs.json
  def create
  	puts log_params
    puts params
    @log = Log.new(:symptom_id => params[:symptom_id],:severity =>log_params[:severity], :user_id => current_user.id, :visit_id => -1)

    respond_to do |format|
      if @log.save
        format.html { redirect_to logs_path, notice: 'Log was successfully created.' }
        format.json { render :show, status: :created, location: @log }
      else
        format.html { render :new }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to @log, notice: 'Log was successfully updated.' }
        format.json { render :show, status: :ok, location: @log }
      else
        format.html { render :edit }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to logs_url, notice: 'Log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def display_log_search_results
    puts "#{params[:symptom_name]}"
    @logs = Log.all
    if current_user != nil
      @results = @logs.where(:user_id => current_user.id)
    end

    if !params[:symptom_name].nil?
      if params[:symptom_name].eql? ""
        @results = @logs.where(:user_id => current_user.id)
      else
        @results = Log.joins(:symptom).where("symptoms.name LIKE '%#{params[:symptom_name]}%'")
      end
    end

    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_params
      params.require(:log).permit(:symptom_id, :severity)
    end
end
