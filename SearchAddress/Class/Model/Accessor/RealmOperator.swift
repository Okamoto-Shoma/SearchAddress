//
//  RealmOperator.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/26.
//

import Foundation
import RealmSwift

final class RealmOperator {

    // RealmError
    private let kRealmError = NSError(domain: "RealmError", code: 0, userInfo: nil) as Error

    // マイグレーション用のRealmのバージョン
    // Realmデータのアップデートがあり、マイグレーションが必要になった際にこの数値を上げて判別すること。
    private let kRealmSchemeVersion: UInt64 = 1

    // MARK: - Realm Initialize

    private func settingDefaultRealm() -> Realm? {
        var realm: Realm?

        do {
            var config = Realm.Configuration()

            let libraryDirectory = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first!
            let filePath = "\(libraryDirectory)/Realm"
            try FileManager.default.createDirectory(atPath: filePath, withIntermediateDirectories: true, attributes: nil)

            var fileUrl = URL(string: filePath)
            fileUrl = fileUrl?.appendingPathComponent("AddressList").appendingPathExtension("realm")

            config.fileURL = fileUrl

            // マイグレーション処理
            config.schemaVersion = self.kRealmSchemeVersion
            config.migrationBlock = { (migration, oldSchemaVersion) in
                // ここでマイグレーションしている
                if oldSchemaVersion < self.kRealmSchemeVersion {
                    // AddressIdObject
                    migration.enumerateObjects(ofType: AddressIdObject.className()) { oldObject, newObject in
                        guard let oldObject = oldObject, let newObject = newObject else { return }

                        if (try? oldObject.tryGetValue(for: "id")) == nil {
                            newObject["id"] = 1
                        }
                    }
                    // AddressListObject
                    migration.enumerateObjects(ofType: AddressListObject.className()) { oldObject, newObject in
                        guard let oldObject = oldObject, let newObject = newObject else { return }

                        if (try? oldObject.tryGetValue(for: "addressId")) == nil {
                            newObject["addressId"] = 0
                        }
                        if (try? oldObject.tryGetValue(for: "firstName")) == nil {
                            newObject["firstName"] = Const.kEmpty
                        }
                        if (try? oldObject.tryGetValue(for: "lastName")) == nil {
                            newObject["lastName"] = Const.kEmpty
                        }
                        if (try? oldObject.tryGetValue(for: "address")) == nil {
                            newObject["address"] = Const.kEmpty
                        }
                        if (try? oldObject.tryGetValue(for: "firstAddress")) == nil {
                            newObject["firstAddress"] = Const.kEmpty
                        }
                        if (try? oldObject.tryGetValue(for: "secondAddress")) == nil {
                            newObject["secondAddress"] = Const.kEmpty
                        }
                        if (try? oldObject.tryGetValue(for: "thirdAddress")) == nil {
                            newObject["thirdAddress"] = Const.kEmpty
                        }
                        if (try? oldObject.tryGetValue(for: "fourthAddress")) == nil {
                            newObject["fourthAddress"] = Const.kEmpty
                        }
                        if (try? oldObject.tryGetValue(for: "buildingName")) == nil {
                            newObject["buildingName"] = Const.kEmpty
                        }
                        if (try? oldObject.tryGetValue(for: "roomNumber")) == nil {
                            newObject["roomNumber"] = Const.kEmpty
                        }
                    }
                }
            }

            realm = try Realm(configuration: config)
        } catch {
            print("!! Realm Instance Error !!")
        }

        return realm
    }

    /// 住所情報の取得
    ///
    /// - Parameter addressId: 住所ID
    /// - Returns: 指定した住所情報
    private func getAddressObject(_ addressId: Int) throws -> AddressListObject? {
        if let realm = self.settingDefaultRealm() {
            return realm.objects(AddressListObject.self).sorted(byKeyPath: "addressId").filter("addressId == %@", addressId).first
        } else {
            throw self.kRealmError
        }
    }
}

// MARK: - RealmOperatorProtocol

extension RealmOperator: RealmOperatorProtocol {

    // MARK: - Address

    /// 住所IDの取得
    ///
    /// - Returns: 住所ID
    func fetchAddressId() throws -> Int {
        if let realm = self.settingDefaultRealm(),
           let addressIdObject = realm.objects(AddressIdObject.self).first {
            return addressIdObject.addressId
        } else {
            throw self.kRealmError
        }
    }

    /// 住所IDの更新
    ///
    /// - Parameter addressId: 住所ID
    func updateAddressId(_ addressId: Int) throws {
        if let realm = self.settingDefaultRealm() {
            if let addressIdObject = realm.objects(AddressIdObject.self).first {
                do {
                    try realm.write {
                        addressIdObject.addressId = addressId
                    }
                } catch {
                    print("AddressId Add Realm Failed!")
                    throw self.kRealmError
                }
            } else {
                let newAddressIdObject = AddressIdObject()
                newAddressIdObject.addressId = addressId
                do {
                    try realm.write {
                        realm.add(newAddressIdObject, update: .modified)
                    }
                } catch {
                    print("AddressId Add Realm Failed!")
                    throw self.kRealmError
                }
            }
        }
    }

    /// 住所情報の取得
    ///
    /// - Returns: 住所情報
    func fetchAddressList() throws -> Results<AddressListObject> {
        if let realm = self.settingDefaultRealm() {
            return realm.objects(AddressListObject.self).sorted(byKeyPath: "addressId")
        } else {
            throw self.kRealmError
        }
    }

    /// 住所情報の追加
    ///
    /// - Parameter addressListModel: AddressListModel
    func addAddressList(_ addressListModel: AddressListModel) throws {
        let addressObject = AddressListObject(addressListModel: addressListModel)

        if let realm = self.settingDefaultRealm() {
            do {
                try realm.write {
                    realm.add(addressObject, update: .modified)
                }
            } catch {
                print("AddressListData Add Realm Failed")
                throw self.kRealmError
            }
        }else {
            throw self.kRealmError
        }
    }

    /// 住所IDで指定した住所情報を削除
    ///
    /// - Parameter addressId: 住所ID
    func deleteAddressList(_ addressId: Int) throws {
        do {
            if let realm = self.settingDefaultRealm(),
               let addressData = try self.getAddressObject(addressId) {
                do {
                    try realm.write {
                        realm.delete(addressData)
                    }
                } catch {
                    print("AddressData Delete Realm Failed!")
                    throw self.kRealmError
                }
            } else {
                throw self.kRealmError
            }
        } catch {
            throw self.kRealmError
        }
    }
}

// MARK: - DynamicObject

private extension DynamicObject {

    /// キーの存在チェック
    ///
    /// - Parameter key: プロパティ名
    /// - Returns: Any?
    func tryGetValue(for key: String) throws -> Any? {
        guard let property = self.objectSchema[key] else {
            throw NSError()
        }

        return self[property.name]
    }
}
