
class CocktailsController < ApplicationController
    before_action :set_cocktail, only: [:show, :edit, :update, :destroy]


    def index
        @cocktails = Cocktail.all
        @cocktails = @cocktails.sort_by &:name
    end


    def show
      @dose = Dose.new
    end
  
    # GET /restaurants/new
    def new
       @cocktail = Cocktail.new
    end

    def edit 
    end

    def create
        @cocktail = Cocktail.new(cocktail_params)
    
        respond_to do |format|
          if @cocktail.save
            format.html { redirect_to @cocktail, notice: 'Cocktail was successfully created.' }
            format.json { render :show, status: :created, location: @cocktail }
          else
            format.html { render :new }
            format.json { render json: @cocktail.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # PATCH/PUT /restaurants/1
      # PATCH/PUT /restaurants/1.json
      def update
        respond_to do |format|
          if @cocktail.update(cocktail_params)
            format.html { redirect_to @cocktail, notice: 'Cocktail was successfully updated.' }
            format.json { render :show, status: :ok, location: @cocktail }
          else
            format.html { render :edit }
            format.json { render json: @restaurant.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # DELETE /restaurants/1
      # DELETE /restaurants/1.json
      def destroy
        @cocktail.destroy
        respond_to do |format|
          format.html { redirect_to cocktail_url, notice: 'Cocktail was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
private

    def set_cocktail
        @cocktail = Cocktail.find(params[:id])
        return @cocktail
    end

    def cocktail_params
        params.require(:cocktail).permit(:name)
      end
end 