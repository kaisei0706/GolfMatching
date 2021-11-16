//
//  HomeViewController.swift
//  GolfMatching
//
//  Created by 岩田海靖 on 2021/10/23.
//

import UIKit
import Firebase

class HomeViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    
    // ユーザーデータを格納する配列
    var userArray: [UserData] = []
    // Firestoreのリスナー
    var listener: ListenerRegistration!
    
    private let photos = ["photo0", "photo1", "photo2", "photo3", "photo4", "photo5","photo6", "photo7", "photo8"]
//
//    private let userImages = ["userImage0", "userImage1", "userImage2", "userImage3", "userImage4", "userImage5","userImage0", "userImage1", "userImage2", "userImage3", "userImage4", "userImage5"]
//
//    private let scores = ["80~84", "110~119", "100~109", "130~", "~79", "90~99", "120~129", "85~89", "100~109"]
//
//    private let ages = ["23", "22", "28", "29", "30", "29", "23", "22", "26"]
//
//    private let cities = ["東京、千葉、埼玉、神奈川", "宮崎、大分", "神奈川、静岡、山梨", "新潟", "長野", "福岡、佐賀、長崎", "東京、千葉、埼玉、神奈川", "北海道", "大阪、兵庫、京都"]
//
    
    // レイアウト設定
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 2.0, bottom: 2.0, right: 2.0)

    // 1行あたりのアイテム数
    private let itemsPerRow: CGFloat = 2

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("DEBUG_PRINT: viewWillAppear")
        
        if listener == nil {
            let usersRef = Firestore.firestore().collection(Const.UserPath)
            self.listener = usersRef.addSnapshotListener() { (querySnapshot, error) in
                if let error = error {
                    print("DEBUG_PRINT: snapshotの取得が失敗しました。 \(error)")
                    return
                }
                // 取得したdocumentをもとにPostDataを作成し、postArrayの配列にする。
                self.userArray = querySnapshot!.documents.map { document in
                    print("DEBUG_PRINT: document取得 \(document.documentID)")
                    let userData = UserData(document: document)
                    return userData
                }
                //collectionViewのリロード
                self.homeCollectionView.reloadData()
            }
            
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userArray.count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            // "Cell" の部分は　Storyboard でつけた cell の identifier。
        let cell: UserCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! UserCollectionViewCell
        print("CEllの登録")
            cell.setUserData(userArray[indexPath.row])

            // Tag番号を使ってインスタンスをつくる
            let photoImageView = cell.contentView.viewWithTag(1)  as! UIImageView
            let photoImage = UIImage(named: photos[indexPath.row])
            photoImageView.image = photoImage
//
//            let userImageView = cell.contentView.viewWithTag(2)  as! UIImageView
//            let userImage = UIImage(named: userImages[indexPath.row])
//            userImageView.image = userImage
//
//            let ageLabel = cell.contentView.viewWithTag(3) as! UILabel
//            ageLabel.text = ages[indexPath.row]
//
//            let cityLabel = cell.contentView.viewWithTag(4) as! UILabel
//            cityLabel.text = cities[indexPath.row]
            

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
            let availableWidth = view.frame.width - paddingSpace
            let widthPerItem = availableWidth / itemsPerRow
            return CGSize(width: widthPerItem , height: widthPerItem + 100)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return sectionInsets
        }
        // セルの行間の設定
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10.0
        }

        // セルが選択されたときの処理
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let detailViewController: DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
            let userData = userArray[indexPath.row]
            detailViewController.id = userData.id
            self.navigationController?.pushViewController(detailViewController, animated: true)
            print("tapされたよ")
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
