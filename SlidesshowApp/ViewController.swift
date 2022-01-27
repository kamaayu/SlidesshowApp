//
//  ViewController.swift
//  SlidesshowApp
//
//  Created by 鎌田歩夢 on 2022/01/05.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var nowIndex:Int = 1
    
    var timer: Timer!
    
    var imageArray:[UIImage] = [
        UIImage(named: "isan1.jpeg")!,
        UIImage(named: "isan2.jpeg")!,
        UIImage(named: "isan3.jpeg")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let startimage = imageArray[nowIndex]
        imageView.image = startimage
            
        
    }
    
    @IBAction func tapStartButton(_ sender:Any){
        if (timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
        }
        else{
            timer.invalidate()
            
            timer = nil
        }
        
        if (timer == nil){
        nextButton.isEnabled = true
        backButton.isEnabled = true
        }
        else{
            nextButton.isEnabled = false
            backButton.isEnabled = false
        }
    }
    
    @IBAction func tapNextButton(_ sender:Any){
        nowIndex += 1
        
        if (nowIndex > imageArray.count-1) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func tapBackButton(_ sender:Any){
        nowIndex -= 1
        
        if (nowIndex < 0) {
            // indexを一番最後の数字に戻す
            nowIndex = imageArray.count-1
        }
        
        imageView.image = imageArray[nowIndex]
    }
    
    @objc func changeImage(){
        nowIndex += 1
        
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toExpansionViewController"){
        let expantionViewController:ExpansionViewController = (segue.destination as? ExpansionViewController)!
            expantionViewController.selectImage = imageArray[nowIndex]
            if self.timer != nil{
                timer.invalidate()
                self.timer = nil
            }
            nextButton.isEnabled = true
            backButton.isEnabled = true
            imageView.image = imageArray[nowIndex]
        }
    }
    
    @IBAction func tapImage(_ sender: Any){
    }
    
    }
    

