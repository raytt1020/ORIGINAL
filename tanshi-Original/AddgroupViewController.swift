//
//  AddgroupViewController.swift
//  tanshi-Original
//
//  Created by Raytt on 2022/02/15.
//

import UIKit
import RealmSwift

class AddgroupViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var groupnameTextField: UITextField!
    @IBOutlet var ninzuuTextField: UITextField!
    @IBOutlet var zimusyoTextField: UITextField!
    @IBOutlet weak var groupImageView: UIImageView!
    
    // ドキュメントディレクトリの「ファイルURL」（URL型）定義
    var documentDirectoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    // ドキュメントディレクトリの「パス」（String型）定義
    let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func performSegueToAddmember() {
        performSegue(withIdentifier: "toAddmember", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddmember" {
            let addmemberViewController = segue.destination as! AddmemberViewController
            let ninzuu = self.ninzuuTextField.text!
            addmemberViewController.ninzuu = Int(ninzuu)
            addmemberViewController.zimusyo = self.zimusyoTextField.text
            addmemberViewController.groupname = self.groupnameTextField.text
            saveImage()
            addmemberViewController.groupImageURL = documentDirectoryFileURL.absoluteString
        }
    }
    @IBAction func openAlbum(_ sender: UIButton) {
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
        groupImageView.image = tmpImage!
  
        dismiss(animated: true, completion: nil)
    }
    
    //保存するためのパスを作成
    func createLocalDataFile() {
        // 作成するテキストファイルの名前
        let fileName = "\(NSUUID().uuidString).png"
        
        // DocumentディレクトリのfileURLを取得
        if documentDirectoryFileURL != nil {
            // ディレクトリのパスにファイル名をつなげてファイルのフルパスを作る
            let path = documentDirectoryFileURL.appendingPathComponent(fileName)
            
            documentDirectoryFileURL = path
        }
    }

    
    //画像を保存する関数の部分
    func saveImage() {
        createLocalDataFile()
        //pngで保存する場合
        let pngImageData = groupImageView.image?.pngData()
        do {
            try pngImageData!.write(to: documentDirectoryFileURL)
        } catch {
            //エラー処理
            print("エラー")
        }
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



