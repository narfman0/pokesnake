# frozen_string_literal: true

require 'net/http'
require 'json'

URL_ROOT = 'https://pokeapi.co/api/v2/'
POKEMON_ROOT = URL_ROOT + 'pokemon/'

class PokemonUpdateJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    number = Pokemon.count + 1
    pokemon_json =  PokemonUpdateJob.request_pokemon_info(number)
    PokemonUpdateJob.handle_pokemon_add(number, pokemon_json)
  end

  def self.handle_pokemon_add(number, pokemon_json)
    name = pokemon_json['name'].capitalize
    types = []
    pokemon_json['types'].each { |type_json|
      type_name = type_json['type']['name']
      types.append(Type.where('lower(name) = ?', type_name.downcase).first)
    }
    Pokemon.create(name: name, number: number, types: types)
  end

  def self.request_pokemon_info(number)
    uri = URI.parse(POKEMON_ROOT + number.to_s + '/')
    Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
      request = Net::HTTP::Get.new uri
      response = http.request request
      return JSON.parse(response.body)
    end
  end
end
