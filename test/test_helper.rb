require 'simplecov'
SimpleCov.start
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pry'
require 'mps7'

Mps7.logger.level = 6

require 'minitest/autorun'
