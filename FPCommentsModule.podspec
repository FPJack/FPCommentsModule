#
# Be sure to run `pod lib lint FPCommentsModule.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FPCommentsModule'
  s.version          = '0.1.0'
  s.summary          = 'A short description of FPCommentsModule.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/FPJack/FPCommentsModule'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'FPJack' => '2551412939@qq.com' }
  s.source           = { :git => 'https://github.com/FPJack/FPCommentsModule.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

#  s.source_files = 'FPCommentsModule/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FPCommentsModule' => ['FPCommentsModule/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'IGListKit'
   s.dependency 'Masonry'




   s.subspec 'Protocal' do |p|
   p.ios.deployment_target = '9.0'
   
   ##########--协议---#########
   p.source_files = 'FPCommentsModule/Classes/Protocal/*'
#   p.resource_bundles = {
#     'XLPagerTabStripObjcContinue' => ['XLPagerTabStripObjcContinue/Assets/*.png','XLPagerTabStripObjcContinue/Assets/*.xib']
#   }
   end
   
   ##########--模型---#########
   s.subspec 'Model' do |m|
   m.ios.deployment_target = '9.0'
   m.source_files = 'FPCommentsModule/Classes/Model/*'
   end
   
   ##########--View---#########
   s.subspec 'View' do |v|
   v.ios.deployment_target = '9.0'
   v.source_files = 'FPCommentsModule/Classes/View/*'
   end
   
   ##########--SectionController---#########
   s.subspec 'SectionController' do |sc|
   sc.ios.deployment_target = '9.0'
   sc.source_files = 'FPCommentsModule/Classes/SectionController/*'
   end
   
   ##########--Comment---#########
   s.subspec 'Comment' do |c|
   c.ios.deployment_target = '9.0'
   c.source_files = 'FPCommentsModule/Classes/Comment/*'
   c.dependency 'TTTAttributedLabel'
   end
   
   s.subspec 'VideoPicture' do |vp|
   vp.ios.deployment_target = '9.0'
   vp.source_files = 'FPCommentsModule/Classes/VideoPicture/*'
   vp.dependency 'FPImageVideoCell'
   end






end
