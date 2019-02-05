# frozen_string_literal: true

gem 'minitest', '~> 5.4'
require 'minitest/autorun'

def full_song
  fixture_file 'full_song.txt'
end

def fixture_file(name)
  full_path = File.join('test', 'fixtures', name)
  return unless File.exist? full_path

  File.read full_path
end
