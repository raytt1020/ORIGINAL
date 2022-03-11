//
//  ViewController.swift
//  tanshi-Original
//
//  Created by Raytt on 2021/12/03.
//
import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    let realm = try! Realm()
    
    var idolArray: [Idol] = []
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var groupLabel: UILabel!
    @IBOutlet var zimusyoLabel: UILabel!
    @IBOutlet var partLabel: UILabel!
    @IBOutlet var backgroundView: UIImageView!
    let groupNameArray = ["blackpink", "aespa", "itzy", "ive", "straykids", "nct127", "enhypen", "nctdream", "gidle", "ateez", "twice", "bts"]
    
    var index: Int = 0
    var groupName: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(groupName)
        switch groupName {
        case "blackpink":
            backgroundView.image = UIImage(named: "ぶらっくぴんく.jpg")
            idolArray.append(Idol(name: "jisoo", imageName: "jisoo.jpg", group: "blackpink", zimusyo: "YG", part: "リードボーカル ビジュ"))
            idolArray.append(Idol(name: "lisa", imageName: "lisa.jpg", group: "blackpink", zimusyo: "YG", part: "メインダンサー リードラッパー \nサブボーカル"))
            idolArray.append(Idol(name: "jennie", imageName: "jennie.jpg", group: "blackpink", zimusyo: "YG", part: "メインラッパー サブボーカル"))
            idolArray.append(Idol(name: "rose", imageName: "rose.jpg", group: "blackpink", zimusyo: "YG", part: "メインボーカル リードダンサー"))
        case "aespa":
            backgroundView.image = UIImage(named: "えすぱ.jpg")
            idolArray.append(Idol(name: "karina", imageName: "karina.jpg", group: "aespa", zimusyo: "SM", part: "サブボーカル リードダンサー"))
            idolArray.append(Idol(name: "winter", imageName: "winter.jpg", group: "aespa", zimusyo: "SM", part: "サブボーカル メインダンサー"))
            idolArray.append(Idol(name: "ningning", imageName: "ningning.jpg", group: "aespa", zimusyo: "SM", part: "メインボーカル"))
            idolArray.append(Idol(name: "jiselle", imageName: "jiselle.jpg", group: "aespa", zimusyo: "SM", part: "メインラッパー サブボーカル"))
        case "itzy":
            backgroundView.image = UIImage(named: "いっじ.jpg")
            idolArray.append(Idol(name: "yeji", imageName: "yeji.jpg", group: "itzy", zimusyo: "JYP", part: "リードボーカル メインダンサー"))
            idolArray.append(Idol(name: "ryujin", imageName: "ryujin.jpg", group: "itzy", zimusyo: "JYP", part: "メインラッパー サブボーカル \nリードダンサー"))
            idolArray.append(Idol(name: "yuna", imageName: "yuna.jpg", group: "itzy", zimusyo: "JYP", part: "サブボーカル ビジュ"))
            idolArray.append(Idol(name: "lia", imageName: "lia.jpg", group: "itzy", zimusyo: "JYP", part: "メインボーカル"))
            idolArray.append(Idol(name: "chaeryeung", imageName: "chaeryeung.jpg", group: "itzy", zimusyo: "JYP", part: "サブボーカル メインダンサー"))
        case "ive":
            backgroundView.image = UIImage(named: "あいぶ.jpg")
            idolArray.append(Idol(name: "yujin", imageName: "yujin.jpg", group: "ive", zimusyo: "STARSHIP", part: "ボーカル"))
            idolArray.append(Idol(name: "liz", imageName: "liz.jpg", group: "ive", zimusyo: "STARSHIP", part: "ボーカル"))
            idolArray.append(Idol(name: "wonyoung", imageName: "wonyoung.jpg", group: "ive", zimusyo: "STARSHIP", part: "ボーカル"))
            idolArray.append(Idol(name: "rei", imageName: "rei.jpg", group: "ive", zimusyo: "STARSHIP", part: "ラップ ボーカル"))
            idolArray.append(Idol(name: "gaeul", imageName: "gaeul.jpg", group: "ive", zimusyo: "STARSHIP", part: "ラップ"))
        case "straykids":
            backgroundView.image = UIImage(named: "すとれいきっず.jpg")
            idolArray.append(Idol(name: "hyunjin", imageName: "hyunjin.jpg", group: "straykids", zimusyo: "JYP", part: "メインダンサー リードラッパー"))
            idolArray.append(Idol(name: "bangchan", imageName: "bangchan.jpg", group: "straykids", zimusyo: "JYP", part: "リードボーカル サブラッパー \nリードダンサー"))
            idolArray.append(Idol(name: "felix", imageName: "felix.jpg", group: "straykids", zimusyo: "JYP", part: "リードラッパー リードダンサー"))
            idolArray.append(Idol(name: "han", imageName: "han.jpg", group: "straykids", zimusyo: "JYP", part: "メインラッパー リードボーカル"))
            idolArray.append(Idol(name: "chanbin", imageName: "chanbin.jpg", group: "straykids", zimusyo: "JYP", part: "メインラッパー サブボーカル"))
            idolArray.append(Idol(name: "leeknow", imageName: "leeknow.jpg", group: "straykids", zimusyo: "JYP", part: "メインダンサー サブボーカル \nサブラッパー"))
            idolArray.append(Idol(name: "IN", imageName: "IN.jpg", group: "straykids", zimusyo: "JYP", part: "サブボーカル"))
            idolArray.append(Idol(name: "seungmin", imageName: "seungin.jpg", group: "straykids", zimusyo: "JYP", part: "リードボーカル"))
        case "nct127":
            backgroundView.image = UIImage(named: "127.jpg")
            idolArray.append(Idol(name: "jaehyun", imageName: "jaehyun.jpg", group: "nct127", zimusyo: "SM", part: "メインボーカル ダンサー"))
            idolArray.append(Idol(name: "taeyong", imageName: "taeyong.jpg", group: "nct127", zimusyo: "SM", part: "メインラッパー メインダンサー"))
            idolArray.append(Idol(name: "mark", imageName: "mark127.jpg", group: "nct127", zimusyo: "SM", part: "メインラッパー メインダンサー"))
            idolArray.append(Idol(name: "jungwoo", imageName: "jungwoo.jpg", group: "nct127", zimusyo: "SM", part: "ボーカル ダンサー"))
            idolArray.append(Idol(name: "doyoung", imageName: "doyoung.jpg", group: "nct127", zimusyo: "SM", part: "メインボーカル"))
            idolArray.append(Idol(name: "yuta", imageName: "yuta.jpg", group: "nct127", zimusyo: "SM", part: "ボーカル ダンサー"))
            idolArray.append(Idol(name: "taeil", imageName: "taeil.jpg", group: "nct127", zimusyo: "SM", part: "メインボーカル"))
            idolArray.append(Idol(name: "johnny", imageName: "johnny.jpg", group: "nct127", zimusyo: "SM", part: "ボーカルラッパー ダンサー"))
            idolArray.append(Idol(name: "haechan", imageName: "haechan.jpg", group: "nct127", zimusyo: "SM", part: "メインボーカル"))
        case "enhypen":
            backgroundView.image = UIImage(named: "えんはいふん.jpg")
            idolArray.append(Idol(name: "niki", imageName: "niki.jpg", group: "enhypen", zimusyo: "HYBE", part: "ダンス"))
            idolArray.append(Idol(name: "sunoo", imageName: "sunoo.jpg", group: "enhypen", zimusyo: "HYBE", part: "ボーカル"))
            idolArray.append(Idol(name: "jay", imageName: "jay.jpg", group: "enhypen", zimusyo: "HYBE", part: "ダンス"))
            idolArray.append(Idol(name: "jungwon", imageName: "jungwoon.jpg", group: "enhypen", zimusyo: "HYBE", part: "ボーカル ダンス"))
            idolArray.append(Idol(name: "sunghoon", imageName: "sunghoon.jpg", group: "enhypen", zimusyo: "HYBE", part: "ビジュ"))
            idolArray.append(Idol(name: "jake", imageName: "jake.jpg", group: "enhypen", zimusyo: "HYBE", part: "ボーカル"))
            idolArray.append(Idol(name: "heesung", imageName: "heesung.jpg", group: "enhypen", zimusyo: "HYBE", part: "ボーカル ダンス"))
        case "nctdream":
            backgroundView.image = UIImage(named: "エヌシーティードリーム.jpg")
            idolArray.append(Idol(name: "mark", imageName: "markdream.jpg", group: "nctdream", zimusyo: "SM", part: "メインラッパー メインダンサー"))
            idolArray.append(Idol(name: "renjun", imageName: "renjun.jpg", group: "nctdream", zimusyo: "SM", part: "メインボーカル リードダンサー"))
            idolArray.append(Idol(name: "haechan", imageName: "haechandream.jpg", group: "nctdream", zimusyo: "SM", part: "メインボーカル"))
            idolArray.append(Idol(name: "jeno", imageName: "jeno.jpg", group: "nctdream", zimusyo: "SM", part: "メインラッパー リードダンサー \nサブボーカル"))
            idolArray.append(Idol(name: "jisung", imageName: "jisung.jpg", group: "nctdream", zimusyo: "SM", part: "メインダンサー サブボーカル \nサブラッパー"))
            idolArray.append(Idol(name: "chenle", imageName: "chenle.jpg", group: "nctdream", zimusyo: "SM", part: "メインボーカル"))
            idolArray.append(Idol(name: "jaemin", imageName: "jaemin.jpg", group: "nctdream", zimusyo: "SM", part: "リードダンサー リードラッパー \nサブボーカル"))
        case "ateez":
            backgroundView.image = UIImage(named: "あちず.jpg")
            idolArray.append(Idol(name: "wooyoung", imageName: "wooyoung.jpg", group: "ateez", zimusyo: "KQ", part: "メインダンサー ボーカル"))
            idolArray.append(Idol(name: "seonghwa", imageName: "seonghwa.jpg", group: "ateez", zimusyo: "KQ", part: "ボーカル"))
            idolArray.append(Idol(name: "hongjoong", imageName: "hongjoong.jpg", group: "ateez", zimusyo: "KQ", part: "ラッパー"))
            idolArray.append(Idol(name: "yunho", imageName: "yunho.jpg", group: "ateez", zimusyo: "KQ", part: "ダンス ボーカル"))
            idolArray.append(Idol(name: "yeosang", imageName: "yeosang.jpg", group: "ateez", zimusyo: "KQ", part: "ボーカル ダンス"))
            idolArray.append(Idol(name: "mingi", imageName: "mingi.jpg", group: "ateez", zimusyo: "KQ", part: "ラップ ダンス"))
            idolArray.append(Idol(name: "jongho", imageName: "jongho.jpg", group: "ateez", zimusyo: "KQ", part: "メインボーカル"))
            idolArray.append(Idol(name: "san", imageName: "san.jpg", group: "ateez", zimusyo: "KQ", part: "ボーカル"))
        case "gidle":
            backgroundView.image = UIImage(named: "あいでゅる.jpg")
            idolArray.append(Idol(name: "yuqi", imageName: "yuqi.jpg", group: "gidle", zimusyo: "CUBE", part: "サブボーカル\nリードダンサー"))
            idolArray.append(Idol(name: "miyeon", imageName: "miyeon.jpg", group: "gidle", zimusyo: "CUBE", part: "メインボーカル"))
            idolArray.append(Idol(name: "minnie", imageName: "minnie.jpg", group: "gidle", zimusyo: "CUBE", part: "メインボーカル"))
            idolArray.append(Idol(name: "soyeon", imageName: "soyeon.jpg", group: "gidle", zimusyo: "CUBE", part: "メインラッパー"))
            idolArray.append(Idol(name: "shuhua", imageName: "shuhua.jpg", group: "gidle", zimusyo: "CUBE", part: "サブボーカル"))
            idolArray.append(Idol(name: "soojin", imageName: "soojin.jpg", group: "gidle", zimusyo: "CUBE", part: "サブボーカル メインダンサー"))
        case "twice":
            backgroundView.image = UIImage(named: "とわいす.jpg")
            idolArray.append(Idol(name: "sana", imageName: "sana.jpg", group: "twice", zimusyo: "JYP", part: "サブボーカル"))
            idolArray.append(Idol(name: "jihyo", imageName: "jihyo.jpg", group: "twice", zimusyo:"JYP", part: "メインボーカル"))
            idolArray.append(Idol(name: "mina", imageName: "mina.jpg", group: "twice", zimusyo: "JYP", part: "リードダンサー"))
            idolArray.append(Idol(name: "momo", imageName: "momo.jpg", group: "twice", zimusyo: "JYP", part: "メインダンサー"))
            idolArray.append(Idol(name: "nayeon", imageName: "nayeon.jpg", group: "twice", zimusyo: "JYP", part: "リードボーカル"))
            idolArray.append(Idol(name: "jeongyeon", imageName: "jeongyeon.jpg", group: "twice", zimusyo: "JYP", part: "リードボーカル"))
            idolArray.append(Idol(name: "dahyun", imageName: "dahyun.jpg", group: "twice", zimusyo: "JYP", part: "リードラッパー"))
            idolArray.append(Idol(name: "tzuyu", imageName: "tzuyu.jpg", group: "twice", zimusyo: "JYP", part: "リードダンサー"))
            idolArray.append(Idol(name: "chaeyoung", imageName: "chaeyoung.jpg", group: "twice", zimusyo: "JYP", part: "メインラッパー"))
        case "bts":
            backgroundView.image = UIImage(named: "ビーティーエス.jpg")
            idolArray.append(Idol(name: "V", imageName: "V.jpg", group: "bts", zimusyo: "HYBE", part: "ビジュ ボーカル"))
            idolArray.append(Idol(name: "RM", imageName: "RM.jpg", group: "bts", zimusyo: "HYBE", part: "ラップ"))
            idolArray.append(Idol(name: "jin", imageName: "jin.jpg", group: "bts", zimusyo: "HYBE", part: "ボーカル ビジュ"))
            idolArray.append(Idol(name: "suga", imageName: "suga.jpg", group: "bts", zimusyo: "HYBE", part: "ラップ"))
            idolArray.append(Idol(name: "j-hope", imageName: "j-hope.jpg", group: "bts", zimusyo: "HYBE", part: "ダンス ラップ"))
            idolArray.append(Idol(name: "jimin", imageName: "jimin.jpg", group: "bts", zimusyo: "HYBE", part: "ダンス ボーカル"))
            idolArray.append(Idol(name: "jungkook", imageName: "jungkook.jpg", group: "bts", zimusyo: "HYBE", part: "ボーカル ダンス \nビジュ"))
        default:
            let group = realm.objects(Group.self).filter { g in
                return g.group == self.groupName
            }.first
            for m in group!.members {
                print(m.imageURL)
                let fileURL = URL(string: m.imageURL)
                let filePath = fileURL?.path
                idolArray.append(Idol(name: m.name, imageName: filePath!, group: groupName, zimusyo: group!.zimusyo, part: m.part))
            }
        }
        setUI()
    }
    func setUI() {
        let search = groupNameArray.filter({ $0 == groupName })
        if search.isEmpty {
            imageView.image = idolArray[index].getImageWithURL()
        } else {
            imageView.image = idolArray[index].getImage()
        }
        nameLabel.text = idolArray[index].name
        groupLabel.text = idolArray[index].group
        zimusyoLabel.text = idolArray[index].zimusyo
        partLabel.text = idolArray[index].part
    }
    @IBAction func mae() {
        index = index - 1
        if index < 0 {
            index = idolArray.count - 1
        }
        setUI()
    }
    @IBAction func tugi() {
        index = index + 1
        if index > idolArray.count - 1 {
            index = 0
        }
        setUI()
    }
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
}

