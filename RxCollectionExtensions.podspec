#
# Be sure to run `pod lib lint RxCollectionExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxCollectionExtensions'
  s.version          = '1.0'
  s.swift_version    = '5'
  s.summary          = 'Extensions of Collection Observable for UITableView, UICollectionView'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    Extensions of Collection Observable for UITableView, UICollectionView
                       DESC

  s.homepage         = 'https://github.com/2sem/RxCollectionExtensions'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '2sem' => 'kofsiwon@siwonschool.com' }
  s.source           = { :git => 'https://github.com/2sem/RxCollectionExtensions.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'RxCollectionExtensions/Classes/**/*', 'RxCollectionExtensions/Extensions/**/*'
  
  # s.resource_bundles = {
  #   'RxCollectionExtensions' => ['RxCollectionExtensions/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
end
