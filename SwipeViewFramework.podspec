Pod::Spec.new do |s|
    s.name = 'SwipeViewFramework'
    s.platform = :ios, '13.0'
    s.version = '1.0.2'
    s.source = { :git => 'https://github.com/vijayvepa/SwipeViewFramework.git', :tag => s.version }
    s.authors = 'Vijay Vepakomma'
    s.license = 'MIT'
  #  s.homepage = 'http://www.philips.com'
    s.homepage = 'https://github.com/vijayvepa/SwipeViewFramework'
    s.summary = 'SwipeView base class for reactive view'
    s.description = 'SwipeView base class for responsive view '
    s.source_files = 'SwipeViewFramework/**/*.swift'
    s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
    s.license = 'LICENSE.md'
    s.swift_version = '4.0'
  end
  