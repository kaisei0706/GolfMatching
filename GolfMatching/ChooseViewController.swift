//
//  ChooseViewController.swift
//  GolfMatching
//
//  Created by 岩田海靖 on 2021/11/13.
//

import UIKit

class ChooseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var chooseTableVIew: UITableView!
    
    var id : String?
    
    var genderArray = ["男性","女性"]
    var choosegenderArray: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseTableVIew.delegate = self
        chooseTableVIew.dataSource = self
        
        chooseTableVIew.allowsMultipleSelection = true

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = chooseTableVIew.dequeueReusableCell(withIdentifier: "ChooseCell", for: indexPath)
        
        cell.textLabel?.text = genderArray[indexPath.row]
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        return cell
    }
    
    // セルが選択された時に呼び出される
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = chooseTableVIew.cellForRow(at:indexPath)
        
        // チェックマークを入れる
        cell?.accessoryType = .checkmark
        
        choosegenderArray.append(genderArray[indexPath.row])
    }
    
    // セルの選択が外れた時に呼び出される
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = chooseTableVIew.cellForRow(at:indexPath)
        
        // チェックマークを外す
        cell?.accessoryType = .none
        
        choosegenderArray.remove(at: indexPath.row)
        print("選択\(choosegenderArray)")
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
