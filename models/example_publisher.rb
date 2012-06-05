require 'pry'

class ExamplePublisher < Jenkins::Tasks::Publisher

    display_name "Example publisher"

    attr_reader :text

    # Invoked with the form parameters when this extension point
    # is created from a configuration screen.
    def initialize(attrs = {})
      attrs.each_pair do |k, v|
        self.instance_variable_set "@#{k}".to_sym, v
      end
    end

    ##
    # Runs before the build begins
    #
    # @param [Jenkins::Model::Build] build the build which will begin
    # @param [Jenkins::Model::Listener] listener the listener for this build.
    def prebuild(build, listener)
      # do any setup that needs to be done before this build runs.
    end

    ##
    # Runs the step over the given build and reports the progress to the listener.
    #
    # @param [Jenkins::Model::Build] build on which to run this step
    # @param [Jenkins::Launcher] launcher the launcher that can run code on the node running this build
    # @param [Jenkins::Model::Listener] listener the listener for this build.
    def perform(build, launcher, listener)
      # TODO wanna access to `result` much ruby way.
      build_result = build.native.result

      listener.info "BuildResult: #{build_result}"
    end

    # TODO select box using Enum like approach
    # TODO validate config
    # TODO field help for config
    # TODO global config
end
