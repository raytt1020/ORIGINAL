//
//  SecondViewController.swift
//  tanshi-Original
//
//  Created by Raytt on 2021/12/24.
//

import UIKit
import RealmSwift

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var realm: Realm!
    @IBOutlet var table: UITableView!
    
    var groupNameArray = [String]()
    var imageNameArray = [String]()
    var nameArray = [String]()
    var partArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.migration()
        realm = try! Realm()
        // Do any additional setup after loading the view.
        table.dataSource = self
        table.delegate = self
        
        groupNameArray = ["blackpink", "aespa", "itzy", "ive", "straykids", "nct127", "enhypen", "nctdream", "gidle", "ateez", "twice", "bts"]
        imageNameArray = ["ブラックピンク.png", "エスパ.jpg", "イッジ.png", "アイブ.jpg", "スキズ.png", "イチリル.png", "エンハイフン.png", "ドリーム.jpg", "アイデュル.jpg", "アチズ.png", "twice.jpg", "bts.png"]//, "jisoo.jpg", "lisa.jpg", "jennie.jpg", "rose.jpg", "karina.jpg", "winter.jpg", "ningning.jpg", "jiselle.jpg", "yeji.jpg", "ryujin.jpg", "yuna.jpg", "lia.jpg", "chaeryeung.jpg", "yujin.jpg", "liz.jpg", "wonyoung.jpg", "rei.jpg","gaeul.jpg", "hyunjin.jpg", "bangchan.jpg", "felix.jpg", "han.jpg", "chanbin.jpg", "leeknow.jpg", "IN.jpg", "seungmin.jpg", "jaehyun.jpg", "taeyong.jpg", "mark.jpg", "jungwoo.jpg", "doyoung.jpg", "yuta.jpg", "taiel.jpg", "johnny.jpg", "haechan.jpg", "niki.jpg", "sunoo.jpg", "jay.jpg", "jungwoo.jpg", "sunghoon.jpg", "jake.jpg", "heesung.jpg", "jaemin.jpg", "markdream.jpg", "renjun.jpg", "haechandream.jpg", "jeno.jpg", "jisung.jpg", "chenle.jpg", "yuqi.jpg", "miyeon.jpg", "minnie.jpg", "soyeon.jpg", "shuhua.jpg", "soojin,jpg", "wooyoung.jpg", "seounghwa.jpg", "hongjooung.jpg", "yunho.jpg", "yeosang.jpg", "mingi.jpg", "jongho.jpg", "san.jpg", "sana.jpg", "jihyo.jpg", "mina.jpg", "momo.jpg", "nayron.jpg", "jeongyeon.jpg", "dahyun.jpg", "tzuyu.jpg", "chaeyoung.jpg", "V.jpg", "RM.jpg", "jin.jpg", "suga.jpg", "j-hope", "jimin.jpg", "jungkook.jpg"]
        let groups = realm.objects(Group.self)
        print(groups)
        for g in groups {
            groupNameArray.append(g.group)
            imageNameArray.append(g.imageURL)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupNameArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = groupNameArray[indexPath.row]
        if indexPath.row >= 12 {
            let fileURL = URL(string: imageNameArray[indexPath.row])
            let filePath = fileURL?.path
            cell?.imageView?.image = UIImage(contentsOfFile: filePath!)
        } else {
            cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(groupNameArray[indexPath.row])が選ばれました！")
        self.performSegue(withIdentifier: "toSecond", sender: indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond" {
            let ViewController = segue.destination as! ViewController
            ViewController.groupName = self.groupNameArray[sender as! Int]
        }
    }
    func performSegueToAddgroupViewController() {
        performSegue(withIdentifier: "toAddgroupView", sender: nil)
    }
    
    
    func migration() {
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 3,
            
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
                // We haven’t migrated anything yet, so oldSchemaVersion == 0
                if (oldSchemaVersion < 1) {
                    // Nothing to do!
                    // Realm will automatically detect new properties and removed properties
                    // And will update the schema on disk automatically
                }
            })
        
        // Tell Realm to use this new configuration object for the default Realm
        Realm.Configuration.defaultConfiguration = config
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


