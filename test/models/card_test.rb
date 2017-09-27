require 'test_helper'

class CardTest < ActiveSupport::TestCase
  def setup
    @json = JSON.parse(File.read('db/source/AllCards-x.json'))
  end

  test 'initializes from json correctly' do
    hash = @json['Research']

    parsed = Card.parse hash
    c = Card.new(parsed)

    #assert name, names, type_line, release_date are correct
    assert_equal('Research', c.name)
    assert_equal(['Research', 'Development'], c.names)
    assert_equal('Instant', c.type_line)

    # TODO are there any cards with a defined release date?
    #assert_equal('2009-10-01'.to_date, c.release_date)
  end
end
