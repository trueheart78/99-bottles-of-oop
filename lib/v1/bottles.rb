# frozen_string_literal: true

require 'byebug'

class V1
  class Bottles
    def verse(number)
      @bottle_count = number
      return last_verse unless bottle_count.positive?
      return one_verse if bottle_count == 1

      standard_verse
    end

    def verses(first, last)
      return unless first > last

      first.downto(last).map { |n| verse n }.join "\n"
    end

    def song
      verses 99, 0
    end

    private

    attr_reader :bottle_count

    def standard_verse
      <<~VERSE
        #{bottle_count} bottles of beer on the wall, #{bottle_count} bottles of beer.
        Take one down and pass it around, #{(bottle_count - 1)} #{bottle_noun} of beer on the wall.
      VERSE
    end

    def one_verse
      <<~VERSE
        1 bottle of beer on the wall, 1 bottle of beer.
        Take it down and pass it around, no more bottles of beer on the wall.
      VERSE
    end

    def last_verse
      <<~VERSE
        No more bottles of beer on the wall, no more bottles of beer.
        Go to the store and buy some more, 99 bottles of beer on the wall.
      VERSE
    end

    def bottle_noun
      return :bottle if bottle_count - 1 == 1

      :bottles
    end
  end
end
