//
//  ViewController.swift
//  Pick-Credit-Card
//
//  Created by Tai-Yun Chen on 2020/5/21.
//  Copyright © 2020 Jack Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardAllImage: UIImageView!
    @IBOutlet weak var cardMomoImage: UIImageView!
    @IBOutlet weak var cardDawhoImage: UIImageView!
    @IBOutlet weak var cardJcbImage: UIImageView!
    @IBOutlet weak var cardGogoImage: UIImageView!
    @IBOutlet weak var cardJkopayImage: UIImageView!
    @IBOutlet weak var cardPiImage: UIImageView!
    @IBOutlet weak var cardLineImage: UIImageView!
    @IBOutlet weak var cardUbearImage: UIImageView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var feeSwitch: UISwitch!
    @IBOutlet weak var givebackTitle: UILabel!
    @IBOutlet weak var givebackIcon: UILabel!
    @IBOutlet weak var givebackText: UILabel!
    @IBOutlet weak var givebackSlider: UISlider!
    @IBOutlet weak var givebackMethod: UISegmentedControl!
    @IBOutlet weak var keywordText: UITextField!
    @IBOutlet weak var percentNumber: UILabel!
    @IBOutlet weak var percentSlider: UISlider!
    @IBOutlet weak var shopCategory: UISegmentedControl!
    @IBOutlet weak var cardNameText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func percentChange(_ sender: UISlider) {
        // Slider數字將小數點轉成整數
        let percent = Int(percentSlider.value)
        percentNumber.text = String(percent) + "%"
    }
    
    @IBAction func givebackChange(_ sender: UISlider) {
        // Slider數字將小數點轉成整數
        let giveback = Int(givebackSlider.value)
        givebackText.text =  String(giveback)
        
        // Slider每一段為10
        let step: Float = 10
        givebackText.text = "\(Int(round(sender.value / step) * step))"
    }
    
    @IBAction func giveBackOption(_ sender: UISwitch) {
        // 無上限Switch切換，隱藏回饋上限Slider
        if feeSwitch.isOn {
            givebackTitle.isHidden = true
            givebackSlider.isHidden = true
            givebackText.isHidden = true
            givebackIcon.isHidden = true
        }
        else {
            givebackTitle.isHidden = false
            givebackSlider.isHidden = false
            givebackText.isHidden = false
            givebackIcon.isHidden = false
        }
    }
    
    @IBAction func pressSearchButton(_ sender: UIButton) {
        // 永豐JCB卡
        if shopCategory.selectedSegmentIndex == 0, percentSlider.value < 4, givebackMethod.selectedSegmentIndex == 0,
            feeSwitch.isOn {
                cardNameText.text = String("永豐現金回饋JCB卡")
                cardJcbImage.isHidden = false
                cardAllImage.isHidden = true
                cardLineImage.isHidden = true
                cardDawhoImage.isHidden = true
                cardPiImage.isHidden = true
                cardJkopayImage.isHidden = true
                cardUbearImage.isHidden = true
                cardMomoImage.isHidden = true
        }
        
        // 聯邦賴點卡
        else if shopCategory.selectedSegmentIndex == 0, percentSlider.value < 4, givebackMethod.selectedSegmentIndex == 1,
            feeSwitch.isOn {
                cardNameText.text = String("聯邦賴點卡")
                cardLineImage.isHidden = false
                cardAllImage.isHidden = true
                cardJcbImage.isHidden = true
                cardDawhoImage.isHidden = true
                cardPiImage.isHidden = true
                cardJkopayImage.isHidden = true
                cardUbearImage.isHidden = true
                cardMomoImage.isHidden = true
        }
        
        // 永豐大戶卡
        else if shopCategory.selectedSegmentIndex == 0,
            percentSlider.value <= 3,
            givebackMethod.selectedSegmentIndex == 2,
            feeSwitch.isOn {
                cardNameText.text = String("永豐DAWHO現金回饋卡")
                cardDawhoImage.isHidden = false
                cardAllImage.isHidden = true
                cardJcbImage.isHidden = true
                cardLineImage.isHidden = true
                cardPiImage.isHidden = true
                cardJkopayImage.isHidden = true
                cardUbearImage.isHidden = true
                cardMomoImage.isHidden = true
        }
        
        // 玉山Pi卡
        if shopCategory.selectedSegmentIndex == 1,
            percentSlider.value < 6,
            givebackMethod.selectedSegmentIndex == 1,
            feeSwitch.isOn {
                cardNameText.text = String("玉山Pi拍錢包信用卡")
                cardPiImage.isHidden = false
                cardAllImage.isHidden = true
                cardJcbImage.isHidden = true
                cardLineImage.isHidden = true
                cardDawhoImage.isHidden = true
                cardJkopayImage.isHidden = true
                cardUbearImage.isHidden = true
                cardMomoImage.isHidden = true
        }
        
        // 台新街口卡
        else if shopCategory.selectedSegmentIndex == 1,
        percentSlider.value < 9,
        givebackMethod.selectedSegmentIndex == 1,
        givebackSlider.value <= 666 {
            cardNameText.text = String("台新街口聯名卡")
            cardJkopayImage.isHidden = false
            cardAllImage.isHidden = true
            cardJcbImage.isHidden = true
            cardLineImage.isHidden = true
            cardDawhoImage.isHidden = true
            cardPiImage.isHidden = true
            cardUbearImage.isHidden = true
            cardMomoImage.isHidden = true
        }
            
        // 玉山Ubear卡
        else if shopCategory.selectedSegmentIndex == 1,
            percentSlider.value <= 20,
            keywordText.text! == "電影院",
            givebackMethod.selectedSegmentIndex == 0,
            givebackSlider.value <= 200 {
                cardNameText.text = String("玉山ＵBear信用卡")
                cardUbearImage.isHidden = false
                cardAllImage.isHidden = true
                cardJcbImage.isHidden = true
                cardLineImage.isHidden = true
                cardDawhoImage.isHidden = true
                cardPiImage.isHidden = true
                cardJkopayImage.isHidden = true
                cardMomoImage.isHidden = true
        }
            
        // 富邦momo卡
        else if shopCategory.selectedSegmentIndex == 2,
            percentSlider.value < 11,
            givebackMethod.selectedSegmentIndex == 1,
            feeSwitch.isOn {
                cardNameText.text = String("富邦momo卡")
                cardMomoImage.isHidden = false
                cardAllImage.isHidden = true
                cardJcbImage.isHidden = true
                cardLineImage.isHidden = true
                cardDawhoImage.isHidden = true
                cardPiImage.isHidden = true
                cardJkopayImage.isHidden = true
                cardUbearImage.isHidden = true
        }
            
        
        else {
//            cardNameText.text = String("刷哪張卡回饋高？")
//            cardAllImage.isHidden = false
//            cardJcbImage.isHidden = true
//            cardLineImage.isHidden = true
//            cardDawhoImage.isHidden = true
//            cardPiImage.isHidden = true
//            cardJkopayImage.isHidden = true
//            cardUbearImage.isHidden = true
//            cardMomoImage.isHidden = true
        }
        
    }
}
