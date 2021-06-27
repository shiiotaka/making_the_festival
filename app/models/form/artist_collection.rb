# class Form::ArtistCollection < Form::Base
#   FORM_COUNT = 4
#   attr_accessor :artists

#   def initialize(attributes = {})
#     super attributes
#     self.artists = FORM_COUNT.times.map { Artist.new } unless artists.present?
#   end

#   def artists_attributes=(attributes)
#     self.artists = attributes.map { |_, v| Artist.new(v) }
#   end

#   def save
#     Artist.transaction do
#       artists.map(&:save!)
#     end
#     true
#     # rescue StandardError => e
#     false
#   end
# end
