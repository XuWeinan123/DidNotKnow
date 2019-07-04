//
//  ExistWordVC.swift
//  DidNotKnow
//
//  Created by XuWeinan on 2019/7/3.
//  Copyright © 2019 徐炜楠. All rights reserved.
//

import UIKit
import RealmSwift

class ExistWordVC: UITableViewController {
    
    let realm = try! Realm()
    var existWords:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        resetExistWord()
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
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 156/3
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return existWords.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ExistWordCell
        cell.existWordLb.text = existWords[indexPath.row]
        return cell
    }
    @IBAction func addExistWord(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "新增词条", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "词条名称"
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel) { (action) in
            
        }
        let saveAction = UIAlertAction(title: "确定", style: .default) { (action) in
            let existWord = (alertController.textFields?.first?.text)!
            print("保存了：\(existWord)")
            //创新新词条
            let existWordData = ExistWord()
            existWordData.word = existWord
            try! self.realm.write {
                self.realm.add(existWordData)
            }
            self.resetExistWord()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        self.present(alertController,animated: true,completion: nil)
    }
    func resetExistWord(){
        existWords = []
        let existWordData = realm.objects(ExistWord.self)
        for i in 0..<existWordData.count{
            existWords.append(existWordData[existWordData.count-i-1].word!)
        }
        self.tableView.reloadData()
    }
}
