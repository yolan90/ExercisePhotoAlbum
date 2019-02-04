//
//  AnimalAndCitiesTableViewController.swift
//  Exercise Photo Album
//
//  Created by Yolanda Halim on 01/02/19.
//  Copyright © 2019 Yolanda Halim. All rights reserved.
//

import UIKit

class AnimalAndCitiesTableViewController: UITableViewController {
    struct PhotoView {
        var name : String
        var lat : Double
        var long : Double
    }

    var animalArr : [PhotoView] = [
        PhotoView(name: "Bear", lat: 50.764259, long: -89.544067),
        PhotoView(name: "Bull" , lat: 28.394857, long: 84.124008),
        PhotoView(name: "Deer" , lat: 39.504041, long: -8.816528),
        PhotoView(name: "Duck" , lat:-36.789491, long: 174.866638),
        PhotoView(name: "Eagle" , lat:-4.746834, long: 142.800293),
        PhotoView(name: "Fox" , lat:25.819672, long: 8.129883),
        PhotoView(name: "Horses" , lat:50.764259, long: -89.544067),
        PhotoView(name: "Monkey" , lat:-4.104684, long: -65.573959),
        PhotoView(name: "Squirrel" , lat:-47.284557, long: -71.343842)]
    
    var cityArr : [PhotoView] = [
        PhotoView(name: "Barcelona", lat: 41.403630, long: 2.174356),
        PhotoView(name: "Chamonix" , lat: 45.941750, long: 6.885424),
        PhotoView(name: "Florence" , lat: 43.773129, long: 11.255515),
        PhotoView(name: "Geneva" , lat: 46.209982, long: 6.155992),
        PhotoView(name: "Gothenburg" , lat:57.710613, long: 11.962996),
        PhotoView(name: "Munich" , lat:48.152961, long: 11.574352),
        PhotoView(name: "San Francisco" , lat:37.802019, long: -122.448678)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return animalArr.count
        }
        return cityArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = animalArr[indexPath.row].name
        } else {
            cell.textLabel?.text = cityArr[indexPath.row].name
        }
        return cell
    }
    
    
    //willDisplay --> a func to set before the display

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotoView" {
            if let destination = segue.destination as? PhotoViewController {
                var index = tableView.indexPathForSelectedRow!
                let indexRow : Int = index.row
                if index.section == 0 {
                    destination.selectedName = animalArr[indexRow].name
                    destination.selectedLat = animalArr[indexRow].lat
                    destination.selectedLong = animalArr[indexRow].long
                    destination.selectedPhotoName = animalArr[indexRow].name
                } else {
                    destination.selectedName = cityArr[indexRow].name
                    destination.selectedLat = cityArr[indexRow].lat
                    destination.selectedLong = cityArr[indexRow].long
                    destination.selectedPhotoName = cityArr[indexRow].name
                }
            }
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


}
