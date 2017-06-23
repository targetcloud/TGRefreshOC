Pod::Spec.new do |s|
  s.name         = "TGRefreshOC"
  s.version      = "0.1.3"
  s.summary      = "橡皮筋下拉刷新控件，弹簧下拉刷新控件，QQ效果下拉刷新，同时支持其他样式"
  s.homepage     = "https://github.com/targetcloud/TGRefreshOC"
  s.license      = "MIT"
  s.author       = { "targetcloud" => "targetcloud@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/targetcloud/TGRefreshOC.git", :tag => s.version }
  s.source_files  = "TGRefreshOC/TGRefreshOC/TGRefreshOC/**/*.{h,m}"
  s.resources     = "TGRefreshOC/TGRefreshOC/TGRefreshOC/TGRefreshOC.bundle"
  s.requires_arc = true
end
