//
//  SearchViewController.swift
//  GolfMatching
//
//  Created by 岩田海靖 on 2021/11/10.
//

import UIKit

class SearchViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UIGestureRecognizerDelegate {
    

    var pickerView: UIPickerView = UIPickerView()
    let genderList = ["男性", "女性"]
    @IBOutlet weak var gendersearchView: UIView!
    @IBOutlet weak var genderLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // タップを定義
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTap(_:)))
        
        gendersearchView.addGestureRecognizer(tap)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        genderLabel.text = "男性"
        pickerView.isHidden = true

        // Do any additional setup after loading the view.
    }
                                    
    
    @objc func viewTap(_ sender: UITapGestureRecognizer){
        print("タップされました")
        pickerView.isHidden = false
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderList.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // ピッカービューに表示する内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderLabel.text = genderList[row]
        pickerView.isHidden = true
    }

}
