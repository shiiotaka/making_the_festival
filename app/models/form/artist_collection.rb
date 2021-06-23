class Form::ArtistCollection < Form::Base
  FORM_COUNT = 4 
  attr_accessor :artists

  def initialize(attributes = {})
    super attributes
    self.artists = FORM_COUNT.times.map { Artist.new() } unless self.artists.present?
  end

  def artists_attributes=(attributes)
    self.artists = attributes.map { |_, v| Artist.new(v) }
  end

  def save
    Artist.transaction do
      self.artists.map(&:save!)
    end
    return true
  rescue => e
    return false
  end
end
