//
//  AddmemberViewController.swift
//  tanshi-Original
//
//  Created by Raytt on 2022/02/18.
//

import UIKit
import RealmSwift

class AddmemberViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Realmの定義
    let realm = try! Realm()
    // ドキュメントディレクトリの「ファイルURL」（URL型）定義
    var documentDirectoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    // ドキュメントディレクトリの「パス」（String型）定義
    let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
       
    
    @IBOutlet var table: UITableView!
    var ninzuu: Int!
    var zimusyo: String!
    var groupname: String!
    var groupImageURL: String!
    var memberImageArray = [UIImage]()
    var selectCellIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self
        for _ in 0..<ninzuu {
            memberImageArray.append(UIImage())
        }
        // Do any additional setup after loading the view.
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ninzuu
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        // cellに画像を表示
        let imageView = cell?.contentView.viewWithTag(1) as! UIImageView
        imageView.image = memberImageArray[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }


    @IBAction func openAlbum(_ sender: UIButton) {
        if let indexPath = table.indexPath(for: sender.superview!.superview as! UITableViewCell) {
            //ボタンが押された時、どのセルのボタンかを取得
            selectCellIndex = indexPath.row//print(indexPath)
        } else {
            print("not found...")
        }
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            picker.allowsEditing = true
            present(picker, animated: true, completion: nil)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:   [UIImagePickerController.InfoKey  : Any]) {

        //ボタンを押されたセルのUIImageViewに画像を表示
        let tmpImage = info[.editedImage] as? UIImage
        memberImageArray[selectCellIndex] = tmpImage!
        //UITableViewをリロード
        table.reloadData()
        dismiss(animated: true, completion: nil)
    }

    @IBAction func save(_ sender: Any) {
        let newGroup = Group()
        let newMemberArray = List<Member>()
        
        for i in 0..<ninzuu {
            let newMember = Member()
            let indexPath = IndexPath(row: i, section: 0)
            let cell = table.cellForRow(at: indexPath)
            let nameTextField = cell?.contentView.viewWithTag(2) as! UITextField
            let partTextField = cell?.contentView.viewWithTag(3) as! UITextField
            let name = nameTextField.text!
            let part = partTextField.text!
            newMember.name = name
            newMember.part = part
            saveImage(imageIndex: i)
            newMember.imageURL = documentDirectoryFileURL.absoluteString
            newMemberArray.append(newMember)
        }
        newGroup.members = newMemberArray
        newGroup.group = groupname
        newGroup.zimusyo = zimusyo
        newGroup.imageURL = groupImageURL
        
        try! realm.write {
            realm.add(newGroup)
        }
        let alert = UIAlertController(title: "成功", message: "保存しました", preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "OK", style: .default, handler: {_ in
                let vc = self.presentingViewController?.presentingViewController
                as! SecondViewController
                vc.loadView()
                vc.viewDidLoad()
                vc.dismiss(animated: true, completion: nil)
            })
    )
        present(alert, animated: true, completion: nil)
    }
    //保存するためのパスを作成する
    func createLocalDataFile() {
        // 作成するテキストファイルの名前
        let fileName = "\(NSUUID().uuidString).png"
        
        // DocumentディレクトリのfileURLを取得
        if documentDirectoryFileURL != nil {
            documentDirectoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            // ディレクトリのパスにファイル名をつなげてファイルのフルパスを作る
            let path = documentDirectoryFileURL.appendingPathComponent(fileName)
            documentDirectoryFileURL = path
        }
    }
    
    //画像を保存する関数の部分
    func saveImage(imageIndex:Int) {
        createLocalDataFile()
        //pngで保存する場合
        let pngImageData = memberImageArray[imageIndex].pngData()
        do {
            try pngImageData!.write(to: documentDirectoryFileURL)
        } catch {
            //エラー処理
            print("エラー")
        }
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
