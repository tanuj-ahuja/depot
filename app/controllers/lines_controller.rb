class LinesController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line, only: [:show, :edit, :update, :destroy]

  # GET /lines
  # GET /lines.json
  def index
    @lines = Line.all
  end

  # GET /lines/1
  # GET /lines/1.json
  def show
  end

  # GET /lines/new
  def new
    @line = Line.new
  end

  # GET /lines/1/edit
  def edit
  end

  # POST /lines
  # POST /lines.json
  def create
    product = Product.find(params[:product_id]) 
    @line = @cart.add_product(product)


    respond_to do |format|
      if @line.save
        format.html { redirect_to root_url }
        format.js   {@current_item=@line}
        format.json { render :show, status: :created, location: @line }
      else
        format.html { render :new }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lines/1
  # PATCH/PUT /lines/1.json
  def update
    respond_to do |format|
      if @line.update(line_params)
        format.html { redirect_to @line, notice: 'Line was successfully updated.' }
        format.json { render :show, status: :ok, location: @line }
      else
        format.html { render :edit }
        format.json { render json: @line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lines/1
  # DELETE /lines/1.json
  def destroy
    @line.destroy
    respond_to do |format|
      format.html { redirect_to lines_url, notice: 'Line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line
      @line = Line.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_params
      params.require(:line).permit(:product_id)
    end
end
