# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'motion/admob/interstitial/version'

Gem::Specification.new do |spec|
  spec.name          = "motion-admob-interstitial"
  spec.version       = Motion::Admob::Interstitial::VERSION
  spec.authors       = ["Shigeaki Matsumura"]
  spec.email         = ["matsu911@gmail.com"]

  spec.summary       = %q{Admob Interstitial Ad library for RubyMotion.}
  spec.description   = %q{Easy to use Admob Interstitial Ad library for RubyMotion.}
  spec.homepage      = "https://github.com/matsu911/motion-admob-interstitial"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
