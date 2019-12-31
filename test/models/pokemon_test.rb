# frozen_string_literal: true

require 'test_helper'

class PokemonTest < ActiveSupport::TestCase
  test 'pokemon 1 types' do
    pokemon = Pokemon.first
    assert_not_nil pokemon
    assert pokemon.types.count == 2
  end

  test 'types count' do
    assert Type.count == 18
  end
end
