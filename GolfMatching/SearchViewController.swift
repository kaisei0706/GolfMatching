//
//  SearchViewController.swift
//  GolfMatching
//
//  Created by 岩田海靖 on 2021/11/10.
//

import UIKit

class SearchViewController: UIViewController,UIGestureRecognizerDelegate {
    
    var genderchoice = "男性"

    let genderList = ["男性", "女性"]
    @IBOutlet weak var gendersearchView: UIView!
    @IBOutlet weak var genderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // タップを定義
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTap(_:)))

        gendersearchView.addGestureRecognizer(tap)
        
        genderLabel.text = genderchoice
        
        print("性別\(genderchoice)")

        // Do any additional setup after loading the view.
    }
    
   
    @objc func viewTap(_ sender: UITapGestureRecognizer){
        print("タップされました")
        let chooseViewController: ChooseViewController = self.storyboard?.instantiateViewController(withIdentifier: "Choose") as! ChooseViewController
        
        
        self.navigationController?.pushViewController(chooseViewController, animated: true)
    }
    
}
