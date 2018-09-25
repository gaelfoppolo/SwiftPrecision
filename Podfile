# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'SwiftPrecision' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SwiftPrecision

  pod 'BigInt', '~> 3.1'
  pod 'Fractional', :git => 'https://github.com/ralfebert/Fractional.git', :commit => '883928a56cdc1d8b6e5bf65a5fa82a46169ecccb'

end

target 'SwiftPrecisionFramework' do
    use_frameworks!

    pod 'BigInt', '~> 3.1'
    pod 'Fractional', :git => 'https://github.com/ralfebert/Fractional.git', :commit => '883928a56cdc1d8b6e5bf65a5fa82a46169ecccb'
end

post_install do |installer|

    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end

    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CONFIGURATION_BUILD_DIR'] = '$PODS_CONFIGURATION_BUILD_DIR'
        end
    end
end
