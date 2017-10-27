//
//  ViewController.swift
//  deviceBeacon
//
//  Created by Mauricio Lorenzetti on 27/10/17.
//  Copyright © 2017 Mauricio Lorenzetti. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth

class ViewController: UIViewController {

    let myUUID = "78908CFE-28EE-4443-85B7-3BD0A6FF0E7E"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        advertiseDevice(region: createBeaconRegion()!)
    }
    
    func createBeaconRegion() -> CLBeaconRegion? {
        let proximityUUID = UUID(uuidString: myUUID)
        let major : CLBeaconMajorValue = 100
        let minor : CLBeaconMinorValue = 1
        let beaconID = "bubble.Beacon"
        
        return CLBeaconRegion(proximityUUID: proximityUUID!, major: major, minor: minor, identifier: beaconID)
    }
    
    func advertiseDevice(region : CLBeaconRegion) {
        let peripheral = CBPeripheralManager(delegate: self, queue: nil)
        let peripheralData = region.peripheralData(withMeasuredPower: nil)
        
        peripheral.startAdvertising(((peripheralData as NSDictionary) as! [String : Any]))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ViewController :CBPeripheralManagerDelegate {
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        print("updated")
    }
}

