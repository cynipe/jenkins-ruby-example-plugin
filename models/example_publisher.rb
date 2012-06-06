require 'pry'

# monkey patch
# https://github.com/jenkinsci/jenkins.rb/commit/4bac65f453d7a444332014f6f52310bf06f5a4d3
module Jenkins::Model::Descriptor

  def getGlobalConfigPage
    base = "/#{name_to_path}/global"
    [base+".erb",base+".haml"].find { |n|
      self.getKlass.getResource(n)
    }
  end
end

class ExamplePublisher < Jenkins::Tasks::Publisher

    display_name "Example publisher"

    attr_reader :text, :select_box

    # Invoked with the form parameters when this extension point
    # is created from a configuration screen.
    def initialize(attrs = {})
      @text = attrs["text"]
      @select_box = attrs["select_box"]
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
end
