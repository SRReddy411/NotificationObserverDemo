//
//  ViewController.swift
//  TableReloadDemo
//
//  Created by volive solutions on 23/07/18.
//  Copyright © 2018 volive solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var play_Btn: UIButton!
    @IBOutlet var text_lbl: UILabel!
    
    let defaultDuration = 2.0
    let defaultDamping = 0.20
    let defaultVelocity = 6.0
   
    
    //Animation
    @IBAction func playAction_Btn(_ sender: Any) {

        animateButton()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(showSpinningWheel(_:)), name: NSNotification.Name(rawValue: "notificationName"), object: nil)
       // animateButton()
    }
    // handle notification
    @objc func showSpinningWheel(_ notification: NSNotification) {
        
        if let text = notification.userInfo?["TEXT"] as? String{
            text_lbl.text = text
            print(text)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //addbtn_action
    @IBAction func addaAction_btn(_ sender: Any) {
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let secondVC = story.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
    // ⬇︎⬇︎⬇︎ animation happens here ⬇︎⬇︎⬇︎
    func animateButton() {
        
        self.play_Btn.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration:0.5,
                       delay:1.0,
                       usingSpringWithDamping: CGFloat(1.0),
                       initialSpringVelocity: CGFloat(1.0),
                       options: .allowUserInteraction,
                       animations: {
                        self.play_Btn.transform = .identity
        },
                       completion: { finished in
                       // self.animateButton()
        }
        )
    }
}

