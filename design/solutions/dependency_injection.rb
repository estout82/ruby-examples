#!/usr/bin/env ruby

# replace (inject) method or class dependencies dynamically

class User < ApplicationRecord
  has_many :notifications, forign_key: :recipient_id

  # pass service in via a method param to 'inject' the dependency
  # WAY easier to test (see below)
  def geocode(service: GoogleMapsApi)
    lat, lng = service.geocode(address)

    update(
      lattitude: lat,
      longitude: lng
    )
  end
end

# normal use ------------------
user.geocode

# testing use -----------------
class FakeMapService
  def initialize(lat, lng)
    @lat, @lng = lat, lng
  end

  def self.geocode(address)
    [@lat, @lng]
  end
end

user.geocode(service: FakeMapSerice) # WAY easier to test than stubbing out the API and what not

test "the maps service works"
  expected_lat, expected_lng = 1233.992, -222.991
  service = FakeService.new(expected_lat, expected_lng)
  lat, lng = user.geocode(service)
  assert_equal expected_lat, lat
  assert_equal expected_lng, lng
end