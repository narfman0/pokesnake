# pokemon controller
class PokemonController < ApplicationController
  def new
    @pokemon= Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      redirect_to @pokemon
    else
      render 'new'
    end
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    if @pokemon.update(pokemon_params)
      redirect_to @pokemon
    else
      render 'edit'
    end
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
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
