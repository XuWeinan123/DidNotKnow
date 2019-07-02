//
//  DataListVC.swift
//  DidNotKnow
//
//  Created by 徐炜楠 on 2019/6/30.
//  Copyright © 2019 徐炜楠. All rights reserved.
//

import UIKit
import RealmSwift

class DataListVC: UITableViewController {

    var dataWordList:[[String]] = []
    
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataWordObjects = realm.objects(WordData.self)
        for i in 0..<dataWordObjects.count{
            dataWordList.append([dataWordObjects[i].word!,dataWordObjects[i].attitude!])
        }
        self.tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataWordList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! DataCell
        cell.word.text = dataWordList[indexPath.row][0]
        cell.attitude.text = dataWordList[indexPath.row][1]
        return cell
    }
    @IBAction func clearAllData(_ sender: UIBarButtonItem) {
        dataWordList = []
        let realmDatas = realm.objects(WordData.self)
        for i in 0..<realmDatas.count{
            try! realm.write {
                realm.delete(realmDatas[0])
            }
        }
        let realmPersons = realm.objects(Person.self)
        for i in 0..<realmPersons.count{
            try! realm.write {
                realm.delete(realmPersons[0])
            }
        }
        self.tableView.reloadData()
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
