Pod::Spec.new do |s|
  s.name         = "TGRefreshOC"
  s.version      = "0.0.1"
  s.summary      = "高仿QQ下拉刷新控件，同时支持其他样式"
  s.homepage     = "https://github.com/targetcloud/TGRefreshOC"
  s.license      = "MIT"
  s.author       = { "targetcloud" => "targetcloud@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/targetcloud/TGRefreshOC.git", :tag => s.version }
  s.source_files  = "TGRefreshOC/TGRefreshOC/TGRefreshOC/**/*.{h,m}"
  s.resources     = "TGRefreshOC/TGRefreshOC/TGRefreshOC/TGRefreshOC.bundle"
  s.requires_arc = true
end
