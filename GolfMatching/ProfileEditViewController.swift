//
//  ProfileEditViewController.swift
//  GolfMatching
//
//  Created by 岩田海靖 on 2021/10/27.
//

import UIKit

class ProfileEditViewController: UIViewController {

    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func nameEditChangeButton(_ sender: Any) {
        let nameEditViewController = self.storyboard?.instantiateViewController(withIdentifier: "NameEdit") as! NameEditViewController
        //NameEditViewControllerへの値渡し
        nameEditViewController.nameEdit = nameLabel.text!
            self.navigationController?.pushViewController(nameEditViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.image = UIImage(named:"photo0")

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
