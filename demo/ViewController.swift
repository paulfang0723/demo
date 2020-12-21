//
//  ViewController.swift
//  demo
//
//  Created by PaulFang on 2020/12/21.
//

import UIKit
//因為有使用講話功能，所以要import AVFoundatione
import AVFoundation

class ViewController: UIViewController {
    //把要執行的outlet拉出來（有Slider/Lable)
    @IBOutlet weak var utteranceTextView: UITextView!
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var speedLable: UILabel!
    @IBOutlet weak var pitchLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //建立一個imageView放GIF檔
        let imageView = UIImageView(frame: CGRect(x: 50, y: 370, width: 300, height: 300))
        //把imageView加入到view裡面
        view.addSubview(imageView)
        //建立一個動畫image
        let animatedImage = UIImage.animatedImageNamed("ef60b0ccd0464021d3f3c5bf0bb9f3ecI13KinEtvP0AQ0XQ-", duration: 4)
        //把動畫image放到imageView裡面
        imageView.image = animatedImage
    }
    //建立ＥＮＴＥＲ鍵的IBAction,讓他依照textView裡的文字講話
    @IBAction func startSpeek(_ sender: UIButton) {
        let utterance = AVSpeechUtterance(string: utteranceTextView.text!)
        let synthesizer = AVSpeechSynthesizer()
        utterance.rate = speedSlider.value
        utterance.pitchMultiplier = pitchSlider.value
        synthesizer.speak(utterance)
    }
    //設定調整speed/pitch時候，所顯示得數字,"%.1F"是顯示小數點第一位的意思,這邊個別把SpeedLable/PitchLable設好
    @IBAction func speedSlider(_ sender: UISlider) {
        speedLable.text = String(format: "%.1f", speedSlider.value)
        pitchLable.text = String(format: "%.1f", pitchSlider.value)
}
}
