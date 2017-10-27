class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.all
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(plan_params)

    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: 'Plan was successfully created.' }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: 'Plan was successfully updated.' }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
    respond_to do |format|
      format.html { redirect_to plans_url, notice: 'Plan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def calculate
      #calculating the patients out of pocket expenses for a medical service
      @plan=Plans.find_by(id:params[:id])
      patient_pay=0.0
      price=params[:price]
      if params[:inpatient]==true
          if price<@plan[:inpatient_copay]
              patient_pay=price
              price=0.0
              else
              patient_pay=@plan[:inpatient_copay]
              price = price - patient_pay
              if price>params[:deductible]
                  patient_pay=patient_pay+params[:deductible]
                  price = price - params[:deductible]
                  price = price * @plan[:coinsurance]
                  patient_pay=patient_pay+price
              end
          end
          else
          if price<@plan[:outpatient_copay]
              patient_pay=price
              price=0.0
              else
              patient_pay=@plan[:outpatient_copay]
              price = price - patient_pay
              if price>params[:deductible]
                  patient_pay=patient_pay+params[:deductible]
                  price = price - params[:deductible]
                  price = price * @plan[:coinsurance]
                  patient_pay=patient_pay+price
              end
          end
      end
      return patient_pay
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def plan_params
        params.require(:plan).permit(:name, :category, :company_id, :coinsurance, :deductible, :out_of_pocket_max, :inpatient_copay, :outpatient_copay)
    end
end
