//
//  ViewController.swift
//  文字的縮放和字數 — UISlider & UITextField 練習
//
//  Created by Jiang Yung Tse on 2021/11/8.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CardImageView: UIImageView!
    
    @IBOutlet weak var TittleTextField: UITextField!
    
    @IBOutlet weak var ContentTextField: UITextField!
    
    //字數
    @IBOutlet weak var TitleTextNumber: UILabel!
    @IBOutlet weak var ContentTextNumber: UILabel!
    
    @IBOutlet weak var SizeSlider: UISlider!
    @IBOutlet weak var TitleFontSizeLabel: UILabel!
    @IBOutlet weak var ContentFontSizeLabel: UILabel!
    
    
    //圖片的Label
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var ContentLabel: UILabel!
    
    //SegmentedControl
    @IBOutlet weak var StyleSegmented: UISegmentedControl!
    
    
    // 輸入匡預設值
    var noteText = ""
    
    override func viewDidLoad() {
        reset()
        super.viewDidLoad()
    }
    
    //輸入匡
    
    @IBAction func InputTitle(_ sender: UITextField) {
        //取得字數
        let text = TittleTextField.text?.count
        TitleTextNumber.text = "\(text!)"
        //收鍵盤
        noteText = "\(sender.text!)"
    }
    
    @IBAction func InputContent(_ sender: UITextField) {
        //取得字數
        let text = ContentTextField.text?.count
        ContentTextNumber.text = "\(text!)"
        //收鍵盤
        noteText = "\(sender.text!)"
    }
    
    //改變文字大小
    @IBAction func ChangeTitleFontSize(_ sender: UISlider) {
//        let font = myTextField.font!
//        let newFont = font.withSize(30.3333)
//        myTextField.font = newFont
        //取得slider數值並小數二位
        let size = sender.value
        let numberString = String(format: "%.2f", size)
//        let number1: Float = 10
//        let number2: CGFloat = CGFloat(number1)
        TitleLabel.font = TitleLabel.font?.withSize(CGFloat(size))
        //放大輸入匡的字
        //myTextField.font = myTextField.font?.withSize(CGFloat(size))
        
        //顯示文字大小
        TitleFontSizeLabel.text = "\(numberString)"
        
        print(numberString)
    }
    
    @IBAction func ChangeContentFontSize(_ sender: UISlider) {
        //取得slider數值並小數二位
        let size = sender.value
        let numberString = String(format: "%.2f", size)
        ContentLabel.font = ContentLabel.font?.withSize(CGFloat(size))
        //顯示文字大小
        ContentFontSizeLabel.text = "\(numberString)"
    }
    // Printing按鈕
    @IBAction func Printing(_ sender: UIButton) {
        //顯示輸入文字
        TitleLabel.text = TittleTextField.text
        ContentLabel.text = ContentTextField.text
    }
    // 點空白收起鍵盤
    @IBAction func TopGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    // 選擇卡片樣式
    @IBAction func ChooseCard(_ sender: UISegmentedControl) {
        if StyleSegmented.selectedSegmentIndex == 0 {
            CardImageView.image = UIImage(named: "Valentine's Day")
            TitleLabel.text = "Happy Valentine's Day"
            ContentLabel.text = "“Especially today, I hope you feel how much I love you and how grateful I am to have you in my life.”"
        }else if StyleSegmented.selectedSegmentIndex == 1{
            CardImageView.image = UIImage(named: "Happy Birthday")
            TitleLabel.text = "Happy Birthday"
            ContentLabel.text = "“I hope you have a fantastic day and a fantastic year to come.“"
        }else {
            CardImageView.image = UIImage(named: "Merry Christmas")
            TitleLabel.text = "Merry Christmas"
            ContentLabel.text = "”May God bless your life with love and joy this holiday season.”"
        }
    }
    
    @IBAction func ResetButton(_ sender: UIButton) {
        reset()
    }
    
    func reset() {
        TitleLabel.text = "Happy Everything"
        ContentLabel.text = "Print what you would like to say~"
        CardImageView.image = UIImage(named: "")
    }
}
