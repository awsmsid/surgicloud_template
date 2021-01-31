lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/surgicloud_template/version'

Gem::Specification.new do |spec|
  spec.name          = "surgicloud_template"
  spec.version       = SurgicloudTemplate::VERSION
  spec.authors       = ["Saddam Husain"]
  spec.email         = ["saddam20.hussain@gmail.com"]

  spec.summary       = "saddam"
  spec.description   = "saddam"
  spec.homepage      = "https://bitbucket.org/awsmsid5/surgicloud_template/src/master"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
