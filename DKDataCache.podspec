Pod::Spec.new do |s| 
  s.name         = 'DKDataCache'

  s.version      = '0.1'

  s.summary      = 'Simple iOS Data Cache.'

  s.homepage     = 'https://github.com/dkhamsing/DKDataCache'

  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { 'dkhamsing' => 'dkhamsing8@gmail.com' }
  
  s.social_media_url   = 'http://twitter.com/dkhamsing'
   
  s.platform     = :ios, '7.0'
 
  s.source       = { :git => 'https://github.com/dkhamsing/DKDataCache.git', :tag => s.version.to_s }

  s.source_files  = 'DKDataCache/*'
  
  s.requires_arc = true
end
