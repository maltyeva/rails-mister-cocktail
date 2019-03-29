class CocktailsController < ApplicationController

  before_action :set_cocktail, only: [:show, :destroy]
  def index
    @cocktails = Cocktail.all
  end

  def ingredients
    @ingredient = Ingredient.find(params[:search][:ingredient])
    @cocktails = @ingredient.cocktails
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @cocktail.destroy
    redirect_to root_path
  end


  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
