require 'bundler/setup'
Bundler.require :default, :test

require 'minitest/spec'
require 'minitest/autorun'
require 'mocha/setup'

ENV['GUARD_ENV'] = 'test'

require_relative '../lib/guard/spinach'
