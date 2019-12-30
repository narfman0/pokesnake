# frozen_string_literal: true

# pokemon controller
class PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      @pokemon.type_ids = params[:pokemon].delete(:types)
      redirect_to @pokemon
    else
      render 'new'
    end
  end

  def update
    @pokemon = Pokemon.find(params[:id])
    @pokemon.type_ids = params[:pokemon].delete(:types)
    if @pokemon.update(pokemon_params)
      redirect_to @pokemon
    else
      render 'edit'
    end
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy

    redirect_to pokemon_index_path
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:number, :name, type_ids: [])
  end
end
