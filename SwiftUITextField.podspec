#
# Be sure to run `pod lib lint SwiftUITextField.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftUITextField'
  s.version          = '1.0.1'
  s.summary          = 'TextField written in SwiftUI with validation capabilities.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  TextField written in SwiftUI with validation capabilities. Check the example project for all the configurations possible.
                       DESC

  s.homepage         = 'https://github.com/nishiths23/SwiftUITextField'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nishith Singh' => 'nishithsingh23@ymail.com' }
  s.source           = { :git => 'https://github.com/nishiths23/SwiftUITextField.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'
  s.platforms = { :ios => "13.0" }
  s.source_files = 'SwiftUITextField/Classes/**/*'
  s.swift_versions = '5.2'
  
  # s.resource_bundles = {
  #   'SwiftUITextField' => ['SwiftUITextField/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
