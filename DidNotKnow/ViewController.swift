//
//  ViewController.swift
//  DidNotKnow
//
//  Created by 徐炜楠 on 2019/6/30.
//  Copyright © 2019 徐炜楠. All rights reserved.
//

import UIKit
import RealmSwift

class Person: Object{
    @objc dynamic var name:String?
    override class func primaryKey() -> String? {
        return "name"
    }
}
class WordData:Object{
    @objc dynamic var word:String?
    @objc dynamic var attitude:String?
    @objc dynamic var owner:Person?
}
class ExistWord:Object{
    @objc dynamic var word:String?
}

class ViewController: UIViewController {
    
    var words:[String] = []
    var datas:[[String]] = []
    @IBOutlet var contentAreaView: UIView!
    @IBOutlet var wordLabel: UILabel!
            let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        resetWords()
        contentAreaView.layer.cornerRadius = 20
        
        print(Realm.Configuration.defaultConfiguration.fileURL)

        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    @IBAction func attitudeAction(_ sender: UIButton) {
        datas.append([wordLabel.text?.description ?? "错误",sender.tag == 0 ? "🙂":"🙁"])
        if(words.count>0){
            wordLabel.text = words.removeFirst()
        }else{
            let alertController = UIAlertController(title: "评价结束", message: "输入名称以保留结果", preferredStyle: .alert)
            alertController.addTextField { (textField) in
                textField.placeholder = "Jennifer"
            }
            let cancelAction = UIAlertAction(title: "不保存", style: .default) { (action) in
                self.resetWords()
            }
            let saveAction = UIAlertAction(title: "确定", style: .default) { (action) in
                var fillerName = (alertController.textFields?.first?.text)!
                fillerName = fillerName == "" ? "Jennifer" : fillerName
                print("以\(fillerName)的名义保存了\(self.datas)")
                //创建新用户
                let newPerson = Person()
                newPerson.name = fillerName
                try! self.realm.write {
                    self.realm.add(newPerson)
                }
                //保存数据到数据库
                for i in 0..<self.datas.count{
                    let newData = WordData()
                    newData.attitude = self.datas[i][1]
                    newData.word = self.datas[i][0]
                    newData.owner = newPerson
                    try! self.realm.write {
                        self.realm.add(newData)
                    }
                }
                
                self.resetWords()
            }
            alertController.addAction(cancelAction)
            alertController.addAction(saveAction)
            self.present(alertController,animated: true,completion: nil)
        }
    }
    func resetWords() {
        datas = []
        words = []
        let realmWords = realm.objects(ExistWord.self)
        for i in 0..<realmWords.count{
            words.append(realmWords[i].word!)
        }
        wordLabel.text = words.removeFirst()
    }
}
