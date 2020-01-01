# frozen_string_literal: true

require 'json'
require 'test_helper'

class PokemonUpdateJobTest < ActiveJob::TestCase
  test '#perform_now' do
    skip 'This makes a network call, skip unless manually debugging'
    PokemonUpdateJob.perform_now
  end

  test '#handle_pokemon_add next' do
    pokemon_json = JSON.parse(file_fixture('pokeapiSquirtle.json').read)
    PokemonUpdateJob.handle_pokemon_add(7, pokemon_json)
  end

  test '#request_pokemon_info invalid' do
    skip 'This makes a network call, skip unless manually debugging'
    assert_raises Exception do
      PokemonUpdateJob.request_pokemon_info(99_999)
    end
  end
end
