# frozen_string_literal: true

module ActionDispatch
  class ExceptionWrapper # rubocop:disable Style/Documentation
    def framework_trace
      []
    end
  end
end

module ActionDispatch
  module Routing
    class RouteSet # rubocop:disable Style/Documentation
      def draw(&block) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
        clear! unless @disable_clear_and_finalize
        eval_block(block)
        finalize! unless @disable_clear_and_finalize
        nil
      rescue StandardError => e
        nicer_message = e.message
        nicer_message = nicer_message.sub(/for .+/, '.')
        nicer_message = nicer_message.sub('ApplicationController::', '')
        nicer_message = nicer_message.sub('uninitialized constant', 'undefined class')
        nicer_message = nicer_message.sub('undefined local variable or method', 'unrecognized')
        nicer_message = nicer_message.sub(/ \(/, '')
        nicer_message = nicer_message.sub(/did you mean/, 'Did you mean')

        route_line = e.backtrace.detect { |line| line !~ %r{/gems} }.sub(%r{^[^/]+}, '')
        route_line.sub!(/:in .+/, '')
        route_line =~ /(.+):(.+)/

        puts
        puts 'ERROR: routes.rb'
        puts nicer_message
        puts route_line
        puts

        rescue_route = proc do
          html = "<h2>There's a problem with your routes.rb file.</h2><p><code>#{nicer_message}</code></p><p><code>#{route_line}</code></p>" # rubocop:disable Layout/LineLength
          get '/' => proc { |_env| [200, { 'Content-Type' => 'text/html' }, [html]] }
          get '*path' => proc { |_env| [200, { 'Content-Type' => 'text/html' }, [html]] }
        end

        eval_block(rescue_route)
      end
    end
  end
end
