//
//  NameEditViewController.swift
//  GolfMatching
//
//  Created by 岩田海靖 on 2021/10/27.
//

import UIKit

class NameEditViewController: UIViewController {
    
    @IBOutlet weak var nameEditTextField: UITextField!
    
    var nameEdit : String?

    override func viewDidLoad() {
        super.viewDidLoad()

      //ProfileEditViewControllerからの値渡し
        nameEditTextField.text = nameEdit
        // Do any additional setup after loading the view.
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
