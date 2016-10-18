
Pod::Spec.new do |s|
  s.name         = 'BBBase'
  s.summary      = 'A collection of iOS components.'
  s.version      = '0.0.3'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'yunlong' => '373885050@qq.com' }
  s.social_media_url = 'http://blog.lvjesus.com'
  s.homepage     = 'https://github.com/lvjesus/BBBase'
  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.source       = { :git => 'https://github.com/lvjesus/BBBase.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  s.source_files = 'BBBaseClass/**/*.{h,m}'
  s.public_header_files = 'BBBaseClass/**/*.{h}'
  s.dependency "YYCategories", "~> 1.0.2"
end




















