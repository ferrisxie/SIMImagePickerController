#
# Be sure to run `pod lib lint SIMImagePickerController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SIMImagePickerController'
  s.version          = '0.0.1'
  s.summary          = 'A simple UIImagePickerView subclass with no cropping in preview viewController'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A simple UIImagePickerView subclass that added with simple photo preview function.(No cropping in preview). 选择完图片后不带裁剪的预览界面~
                       DESC

  s.homepage         = 'https://github.com/xferris/SIMImagePickerController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'XFerris' => 'xwh826529092@icloud.com' }
  s.source           = { :git => 'https://github.com/xferris/SIMImagePickerController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SIMImagePickerController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SIMImagePickerController' => ['SIMImagePickerController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'MWPhotoBrowser'
end
