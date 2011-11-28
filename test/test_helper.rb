require 'bundler/setup'
Bundler.require :default, :test

require 'mocha'
require 'minitest/spec'
require 'minitest/autorun'
require 'mocha/integration/mini_test'

ENV['GUARD_ENV'] = 'test'

require_relative '../lib/guard/spinach'
