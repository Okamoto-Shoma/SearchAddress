# Uncomment the next line to define a global platform for your project
# platform :ios, '13.0'

def shared_pods
  use_frameworks!
  inhibit_all_warnings!

  pod 'R.swift', '6.1.0'
  pod 'RealmSwift', '10.19.0'
end

target 'SearchAddress' do
  shared_pods
end

target 'SearchAddressTests' do
  inherit! :search_paths
  pod 'Cuckoo', '1.5.1'
end

target 'SearchAddressUITests' do
  shared_pods
end

post_install do |installer|
    # 変更対象のターゲット名
    target_names = ["R.swift", "Cuckoo", "RealmSwift"]
    target_names.each do |target_name|
        # 変更対象のターゲット を探す
        pods_target = installer.pods_project.targets.find{ |target| target.name == target_name }
        unless pods_target
            raise ::Pod::Informative, "Failed to find '" << target_name << "' target"
        end

        # ビルド設定を追加
        pods_target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        end
    end
end
