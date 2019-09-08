class SlangsController < ApplicationController
  before_action :set_slang, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :new, :destroy, :edit, :updte]

  # GET /slangs
  # GET /slangs.json
  def index
    @slangs = Slang.all.order("created_at DESC")
    
  end

  # GET /slangs/1
  # GET /slangs/1.json
  def show
  end

  # GET /slangs/new
  def new
    @slang = Slang.new
  end

  # GET /slangs/1/edit
  def edit
  end

  # POST /slangs
  # POST /slangs.json
  def create
    # @slang = Slang.new(slang_params)
    @slang = Slang.new(slang_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @slang.save
        format.html { redirect_to @slang, notice: 'Slang was successfully created.' }
        format.json { render :show, status: :created, location: @slang }
      else
        format.html { render :new }
        format.json { render json: @slang.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slangs/1
  # PATCH/PUT /slangs/1.json
  def update
    respond_to do |format|
      if @slang.update(slang_params)
        format.html { redirect_to @slang, notice: 'Slang was successfully updated.' }
        format.json { render :show, status: :ok, location: @slang }
      else
        format.html { render :edit }
        format.json { render json: @slang.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slangs/1
  # DELETE /slangs/1.json
  def destroy
    @slang.destroy
    respond_to do |format|
      format.html { redirect_to slangs_url, notice: 'Slang was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slang
      @slang = Slang.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slang_params
      params.require(:slang).permit(:slang, :meaning, :usage)
    end
end
