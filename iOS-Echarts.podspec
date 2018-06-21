Pod::Spec.new do |s|
  s.name                = "TJBehaviourAnalysis"
  s.version             = "1.0.0"
  s.summary             = "A custom test project"
  s.homepage            = "https://github.com/theoneab/BehaviourA"
  s.license             = { :type => "MIT", :file => 'LICENSE.md' }
  s.author              = { "PlutoY" => "xiuxingzheyi@163.com" }
  #s.platform            = :ios, "7.0"
  s.source              = { :git => "https://github.com/theoneab/BehaviourA.git", :tag => s.version}
  s.source_files        = "TJBehaviourAnalysis/**/*.{h,m}"
  s.resource_bundles    = { 'TJBehaviourAnalysis' => 'TJBehaviourAnalysis/Resources/**' }
  s.prefix_header_contents = '#import "PYUtilities.h"'
  s.requires_arc        = true
  s.ios.frameworks          = 'UIKit'
  s.osx.frameworks          = 'AppKit', 'WebKit'

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'

end
