#
# Be sure to run `pod lib lint SimpleServiceRegistry.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SimpleServiceRegistry'
  s.version          = '3.0.2'
  s.summary          = 'Simple Service Registry to facilitate Dependency Injection by removing the need for Singleton'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Use the Service Registry to store services instance using a type as theire key. Using a Protocol as the key to retreive an instance would be the best option.
                       DESC

  s.homepage         = 'https://github.com/VinceBurn/SimpleServiceRegistry'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vincent Bernier' => 'vincentbernier@hotmail.com' }
  s.source           = { :git => 'https://github.com/VinceBurn/SimpleServiceRegistry.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/2000Bernier'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SimpleServiceRegistry/Classes/**/*'

end
