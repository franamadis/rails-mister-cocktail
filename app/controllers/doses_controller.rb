class DosesController < ApplicationController

    def new
        @cocktail = Cocktail.find(params[:cocktail_id])
        @dose = Dose.new
    end

    def create
        @dose = Dose.new(dose_params)
        @dose.cocktail = Cocktail.find(params[:cocktail_id])
      #   binding.pry
        if @dose.save
          redirect_to cocktail_path(@dose.cocktail)
        else
          render :new
        end
    end

      def destroy
        @dose = Dose.find(params[:id])
        @dose.destroy
        respond_to do |format|
          format.html { redirect_to dose_url, notice: 'Dose was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
private

    def dose_params
        params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
      end
end
