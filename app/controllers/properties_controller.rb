class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    @state = params[:state]
    @region = params[:region]
    @town = params[:town]
    @kind = params[:kind]
    @min_price = params[:min_price]
    @max_price = params[:max_price]
    @min_population = params[:min_population]
    @max_population = params[:max_population]
    @q = Property.search(:state_cont => @state,
                         :region_cont => @region,
                         :town_cont => @town,
                         :kind_cont => @kind,
                         :price_gt => @min_price,
                         :price_lt => @max_price,
                         :population_gt => @min_population,
                         :population_lt => @max_population
                         )
    @properties = @q.result
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # GET /properties/compare?x1=1&x2=2
  def compare
    @x1 = params[:x1].to_i
    @x2 = params[:x2].to_i
    @ids = [@x1, @x2]
    @q = Property.search(:id_in => @ids)
    @properties = @q.result
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:name, :price, :population, :state, :region, :town, :kind, :position, :description)
    end
end
