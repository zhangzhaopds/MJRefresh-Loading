#
#  Be sure to run `pod spec lint MJRefreshLoading.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "MJRefreshLoading"
  s.version      = "0.0.1"
  s.summary      = "基于MJRefresh的自定义刷新动画"
  s.homepage     = "https://github.com/zhangzhaopds/MJRefresh-Loading"
  s.author             = { "heyfox" => "zhangzhaopds@foxmail.com" }
  s.source       = { :git => "https://github.com/zhangzhaopds/MJRefresh-Loading.git", :tag => s.version }
  s.requires_arc = true
  s.source_files  = "MJRefreshLoadingDemo/MJRefreshLoadingDemo/MJRefreshLoading/*"
  s.dependency 'MJRefresh'
  s.ios.deployment_target = '8.0'
  s.license      = "MIT"

end
