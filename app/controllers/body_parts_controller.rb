class BodyPartsController < ApplicationController
  before_action :set_body_part, only: [:show, :edit, :update, :destroy]

  # GET /body_parts
  # GET /body_parts.json
  def index
    @body_parts = BodyPart.all
  end

  def diagram
    @body_parts = BodyPart.all
    
    type = params[:type]
    btn_classes = "btn btn-md btn-primary"
    @btn_m_classes = btn_classes
    @btn_i_classes = btn_classes
    @btn_f_classes = btn_classes
    
    if type == 'm'
      @image_tag = 'male.png'
      @btn_m_classes += " disabled"
    elsif type == 'f'
      @image_tag = 'female.png'
      @btn_f_classes += " disabled"
    elsif type == 'i' or type == nil
      @image_tag = 'intersex.png'
      @btn_i_classes += " disabled"
    end
    
  end

  # GET /body_parts/1
  # GET /body_parts/1.json
  def show
    @body_part = set_body_part
    @symptoms = @body_part.symptoms
    @diseases = @body_part.diseases
  end

  # GET /body_parts/new
  def new
    @body_part = BodyPart.new
  end

  # GET /body_parts/1/edit
  def edit
  end

  # POST /body_parts
  # POST /body_parts.json
  def create
    @body_part = BodyPart.new(body_part_params)

    respond_to do |format|
      if @body_part.save
        format.html { redirect_to @body_part, notice: 'Body part was successfully created.' }
        format.json { render :show, status: :created, location: @body_part }
      else
        format.html { render :new }
        format.json { render json: @body_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /body_parts/1
  # PATCH/PUT /body_parts/1.json
  def update
    respond_to do |format|
      if @body_part.update(body_part_params)
        format.html { redirect_to @body_part, notice: 'Body part was successfully updated.' }
        format.json { render :show, status: :ok, location: @body_part }
      else
        format.html { render :edit }
        format.json { render json: @body_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /body_parts/1
  # DELETE /body_parts/1.json
  def destroy
    @body_part.destroy
    respond_to do |format|
      format.html { redirect_to body_parts_url, notice: 'Body part was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_body_part
      @body_part = BodyPart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def body_part_params
      params.require(:body_part).permit(:name, :type)
    end
end
