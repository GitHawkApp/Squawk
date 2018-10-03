Pod::Spec.new do |spec|
  spec.name         = 'Squawk'
  spec.version      = '0.1.0'
  spec.license      = { :type => 'MIT' }
  spec.homepage     = 'https://github.com/GitHawkApp/Squawk'
  spec.authors      = { 'Ryan Nystrom' => 'rnystrom@whoisryannystrom.com' }
  spec.summary      = 'Quick & interactive alerts.'
  spec.source       = { :git => 'https://github.com/ehudadler/Squawk.git', :tag => spec.version.to_s }
  spec.source_files = 'Source/*.swift'
  spec.platform     = :ios, '11.0'
  spec.swift_version = '4.0'
end
