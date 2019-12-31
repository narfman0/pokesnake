# frozen_string_literal: true

require 'test_helper'

class PokemonUpdateJobTest < ActiveJob::TestCase
  test 'pokemon update' do
    PokemonUpdateJob.perform_now
    assert true
  end
end
