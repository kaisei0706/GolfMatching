//
//  ChooseViewController.swift
//  GolfMatching
//
//  Created by 岩田海靖 on 2021/11/13.
//

import UIKit

class ChooseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var chooseTableVIew: UITableView!
    
    var doneBarButtonItem: UIBarButtonItem!
    
    struct Gender {
        var gender : String
        var choose : Bool
        
        init(gender: String, choose: Bool){
            self.gender = gender
            self.choose = choose
        }
    }
    
    var genderArray: [Gender] = [
        Gender(gender:  "男性", choose: false),
        Gender(gender:  "女性", choose: false)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseTableVIew.delegate = self
        chooseTableVIew.dataSource = self
        
        chooseTableVIew.allowsMultipleSelection = true
        
        doneBarButtonItem = UIBarButtonItem(title: "done", style: .done, target: self, action: #selector(doneBarButtonTapped(_:)))
                        // ③バーボタンアイテムの追加
            self.navigationItem.rightBarButtonItems = [doneBarButtonItem]

        // Do any additional setup after loading the view.
    }
    
    @objc func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        print("doneボタンが押された!")
        let searchViewController: SearchViewController = self.storyboard?.instantiateViewController(withIdentifier: "Search") as! SearchViewController
        
        if genderArray[0].choose == true {
            if genderArray[1].choose == true {
                searchViewController.genderchoice = "\(genderArray[0].gender),\(genderArray[1].gender)"
            } else {
                searchViewController.genderchoice = "\(genderArray[0].gender)"
            }
        } else {
            searchViewController.genderchoice = "\(genderArray[1].gender)"
        }
        
        self.navigationController?.pushViewController(searchViewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = chooseTableVIew.dequeueReusableCell(withIdentifier: "ChooseCell", for: indexPath)
        
        cell.textLabel?.text = genderArray[indexPath.row].gender
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        
        return cell
    }
    
    // セルが選択された時に呼び出される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = chooseTableVIew.cellForRow(at:indexPath)
        
        // チェックマークを入れる
        cell?.accessoryType = .checkmark
        genderArray[indexPath.row].choose = true
        print("Bool:\(genderArray[0]):\(genderArray[1])")

    }
    
    // セルの選択が外れた時に呼び出される
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = chooseTableVIew.cellForRow(at:indexPath)
        
        // チェックマークを外す
        cell?.accessoryType = .none
        genderArray[indexPath.row].choose = false
        print("Bool:\(genderArray[0]):\(genderArray[1])")
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
