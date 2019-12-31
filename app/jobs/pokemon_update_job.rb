# frozen_string_literal: true

require 'net/http'
require 'json'

URL_ROOT = 'https://pokeapi.co/api/v2/'
POKEMON_ROOT = URL_ROOT + 'pokemon/'

class PokemonUpdateJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    number = Pokemon.count + 1
    pokemon_json = request_pokemon_info(number)
    name = pokemon_json['name']
    Pokemon.create(name: name, number: number)
  end

  def request_pokemon_info(number)
    uri = URI.parse(POKEMON_ROOT + number.to_s + '/')
    Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
      request = Net::HTTP::Get.new uri
      response = http.request request
      return JSON.parse(response.body)
    end
  end
end
