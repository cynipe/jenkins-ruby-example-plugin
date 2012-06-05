Jenkins::Plugin::Specification.new do |plugin|
  plugin.name = "jenkins-ruby-example"
  plugin.display_name = "Jenkins Ruby Example Plugin"
  plugin.version = '0.0.1'
  plugin.description = 'TODO: enter description here'

  # You should create a wiki-page for your plugin when you publish it, see
  # https://wiki.jenkins-ci.org/display/JENKINS/Hosting+Plugins#HostingPlugins-AddingaWikipage
  # This line makes sure it's listed in your POM.
  plugin.url = 'https://wiki.jenkins-ci.org/display/JENKINS/Jenkins+Ruby+Example+Plugin'

  # The first argument is your user name for jenkins-ci.org.
  plugin.developed_by "cynipe", "cynipe <cynipe@gmail.com>"

  # This specifies where your code is hosted.
  # Alternatives include:
  #  :github => 'myuser/jenkins-ruby-example-plugin' (without myuser it defaults to jenkinsci)
  #  :git => 'git://repo.or.cz/jenkins-ruby-example-plugin.git'
  #  :svn => 'https://svn.jenkins-ci.org/trunk/hudson/plugins/jenkins-ruby-example-plugin'
  plugin.uses_repository :github => "jenkins-ruby-example-plugin"

  # This is a required dependency for every ruby plugin.
  plugin.depends_on 'ruby-runtime', '0.10'

  # This is a sample dependency for a Jenkins plugin, 'git'.
  #plugin.depends_on 'git', '1.1.11'
end
