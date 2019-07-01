//
//  ViewController.swift
//  DidNotKnow
//
//  Created by 徐炜楠 on 2019/6/30.
//  Copyright © 2019 徐炜楠. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var words:[String] = []
    var datas:[[String]] = []
    @IBOutlet var contentAreaView: UIView!
    @IBOutlet var wordLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        resetWords()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        contentAreaView.layer.cornerRadius = 20
        
        
        
        
        // Do any additional setup after loading the view.
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
        for i in 0..<10{
            words.append("描述语句\(i)")
        }
        wordLabel.text = words.removeFirst()
    }
}
