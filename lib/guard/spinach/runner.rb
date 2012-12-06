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
        notify($? == 0)
      end

      def run_command
        "spinach #{paths.join(" ")}"
      end

      def notify(passed)
        opts = {title: 'Spinach results', priority: 2}

        if passed
          status = 'Passed'
          image = :success
        else
          status = 'Failed'
          image = :failed
        end

        Notifier.notify(status, opts.merge(image: image))
      end
    end
  end
end
