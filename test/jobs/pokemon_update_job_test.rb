# frozen_string_literal: true

require 'json'
require 'test_helper'

class PokemonUpdateJobTest < ActiveJob::TestCase
  test '#perform_now' do
    # note: do not run this in every test, but leaving it as optional for
    # manual debugging.
    # PokemonUpdateJob.perform_now
    assert true
  end

  test '#handle_pokemon_add next' do
    pokemon_json = JSON.parse(file_fixture('pokeapiSquirtle.json').read)
    PokemonUpdateJob.handle_pokemon_add(7, pokemon_json)
    assert true
  end
end
