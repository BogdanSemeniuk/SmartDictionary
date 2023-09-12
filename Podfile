platform :ios, '12.0'

target 'SmartDictionary' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SmartDictionary
pod 'Alamofire', '~> 4.7'
pod 'RealmSwift'



  target 'SmartDictionaryTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  post_install do |installer|
      installer.generated_projects.each do |project|
            project.targets.each do |target|
                target.build_configurations.each do |config|
                    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
                 end
            end
     end
  end

end
