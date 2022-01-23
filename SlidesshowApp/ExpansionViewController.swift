//
//  ExpansionViewController.swift
//  SlidesshowApp
//
//  Created by 鎌田歩夢 on 2022/01/09.
//

import UIKit

class ExpansionViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var selectImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = selectImage
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        backButton.titleLabel?.adjustsFontSizeToFitWidth = true

        // Do any additional setup after loading the view.
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
