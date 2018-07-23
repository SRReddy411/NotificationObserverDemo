//
//  ViewController.swift
//  TableReloadDemo
//
//  Created by volive solutions on 23/07/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var text_lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSpinningWheel(_:)), name: NSNotification.Name(rawValue: "notificationName"), object: nil)

    }
    // handle notification
    @objc func showSpinningWheel(_ notification: NSNotification) {
        
        if let image = notification.userInfo?["TEXT"] as? String{
            text_lbl.text = image
            print(image)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func addaAction_btn(_ sender: Any) {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let secondVC = story.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

