module Guard
  class Spinach
    class Runner
      attr_reader :paths

      def initialize(paths)
        @paths = paths
      end

      def run
        message = "Running #{paths.empty? ? "all Spinach features" : paths.join(" ")}"
        UI.info message, :reset => true
        system(run_command)
      end

      def run_command
        "spinach #{paths.join(" ")}"
      end
    end
  end
end
