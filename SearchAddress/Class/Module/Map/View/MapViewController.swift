//
//  MapViewController.swift
//  PizzaConsumerAddress
//
//  Created by 岡本 翔真 on 2022/01/31.
//

import UIKit
import MapKit

final class MapViewController: UIViewController {
    var presenter: MapPresenterProtocol?

    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var firstAddressLabel: UILabel!
    @IBOutlet private weak var secondAddressLabel: UILabel!
    @IBOutlet private weak var buildNameLabel: UILabel!
    @IBOutlet private weak var roomNumberLabel: UILabel!


    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.presenter?.viewWillAppear()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        self.presenter?.viewDidDisappear()
    }
}

// MARK: - MapPresenterProtocol

extension MapViewController: MapViewProtocol {

    /// 現在の文言を適用
    ///
    /// - Parameters:
    ///   - firstAddressText: 住所1
    ///   - secondAddressText: 住所2
    ///   - buildingNameText: 建物名
    ///   - roomNumberText: 部屋番号
    func applyCurrentText(firstAddressText: String,
                          secondAddressText: String,
                          buildingNameText: String,
                          roomNumberText: String) {
        DispatchQueue.main.async {
            self.firstAddressLabel.text = firstAddressText
            self.secondAddressLabel.text = secondAddressText
            self.buildNameLabel.text = buildingNameText
            self.roomNumberLabel.text = roomNumberText
        }
    }

    /// マップに適用
    ///
    /// - Parameter address: 住所
    func applyMapView(address: String) {
        let myGeoCoder = CLGeocoder()

        myGeoCoder.geocodeAddressString(address,
                                        completionHandler: { (placeMarks, error) in
            if (error == nil) {
                for placeMark in placeMarks! {
                    let location: CLLocation = placeMark.location!
                    // 中心
                    let center = CLLocationCoordinate2DMake(location.coordinate.latitude,
                                                            location.coordinate.longitude)
                    // 表示範囲
                    let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                    // 中心と表示範囲をマップに登録
                    let region = MKCoordinateRegion(center: center, span: span)
                    self.mapView.setRegion(region, animated: true)

                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude,
                                                                       location.coordinate.longitude)
                    self.mapView.addAnnotation(annotation)
                }
            } else {
                print("✌️検索できませんでした。")
            }
        })
    }
}
