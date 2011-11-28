require 'guard'
require 'guard/guard'

module Guard
  class Spinach < Guard
    def start
      run_all if @options[:all_on_start]
    end

    def run_all
      Runner.new([]).run
    end

    def run_on_change(paths)
      Runner.new(paths).run
    end
  end
end

require_relative "spinach/runner"
require_relative "spinach/version"
