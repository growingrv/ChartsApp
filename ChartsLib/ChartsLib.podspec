Pod::Spec.new do |spec|

  spec.name = "ChartsLib"
  spec.version = "0.0.1"
  spec.platform = :ios
  spec.ios.deployment_target = '11.0'
  spec.summary = "A library for rendering Credit score of a user."
  spec.description = "A library for rendering Credit score of user. Also used to show the benchmarking done when evaluating a user's credit score"
  spec.homepage = "http://github.com/ChartsLib"
  # spec.license = { :type => "MIT", :file => "LICENSE" }
  spec.author = { "IN22915016" => "gaurav.tiwari@tesco.com" }
  spec.source = { :git => "https://github.com/TheCodedSelf/RWPickFlavor.git",
             :tag => "#0.1.1" }
  spec.source_files  = "ChartsLib/**/*.{swift}"
  spec.resources = "ChartsLib/**/*.{xib}"
  spec.resource_bundles = {
    'ChartsLib' => ['ChartsLib/**/*.xib', 'ChartsLib/**/*.xcassets']
  }

end
