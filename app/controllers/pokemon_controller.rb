class PokemonController < ApplicationController
  def new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.save
    redirect_to @pokemon
  end

  def index
    @pokemon = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  private
    def pokemon_params
      params.require(:pokemon).permit(:number, :name)
    end
end
