//
//  PhotoViewController.swift
//  Exercise Photo Album
//
//  Created by Yolanda Halim on 01/02/19.
//  Copyright © 2019 Yolanda Halim. All rights reserved.
//

import UIKit
import MapKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var mapView: MKMapView!
    
    var selectedName : String = ""
    var selectedPhotoName : String = ""
    var selectedLat : Double = 0.0
    var selectedLong : Double = 0.0
    var isNightMode : Bool = false

    @IBAction func changeFrameBackground(_ sender: UITapGestureRecognizer) {
        isNightMode = !isNightMode
         self.view.backgroundColor = isNightMode ? .white : .black
        print("test")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoView.image = UIImage(named: selectedPhotoName)
        
        let coord = CLLocationCoordinate2D.init(latitude: selectedLat, longitude: selectedLong)
        
        // 3º Defining the zoom
        let zoom = MKCoordinateSpan.init(latitudeDelta: 0.810, longitudeDelta: 0.810)
        
        // The map property to show a location is region
        mapView.region = MKCoordinateRegion.init(center: coord, span: zoom)
        
        //
        mapView.showsUserLocation = true
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
