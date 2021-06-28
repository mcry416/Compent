//
//  ImageViewController.swift
//  Compent
//
//  Created by Eldest's MacBook on 2021/6/26.
//

import UIKit

class ImageViewController: BaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var buttonSelect: UIButton!
    var imageView: UIImageView!
    
    private func initView(){
        buttonSelect = UIButton(type: .system)
        buttonSelect.setTitle("Select", for: UIControl.State.normal)
        buttonSelect.frame = CGRect(x: ((self.view.frame.width / 2) - 35), y: (self.view.frame.width - 200), width: 70, height: 30)
        buttonSelect.addTarget(self, action: #selector(selectPicture), for: UIControl.Event.touchDown)
        self.view.addSubview(buttonSelect)
        
        imageView = UIImageView(frame: CGRect(x: ((self.view.frame.width / 2) - 120), y: ((self.view.frame.height / 2) + 50), width: 240, height: 240))
        imageView.image = UIImage(named: "taylor")
        self.view.addSubview(imageView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }
    
    @objc func selectPicture(){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let pickerVC = UIImagePickerController()
            pickerVC.delegate = self
            pickerVC.sourceType = UIImagePickerController.SourceType.camera
            self.present(pickerVC, animated: true, completion: nil)
        } else {
            print("------> ERROR")
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("------> INFO:\(info)")
        
        let image: UIImage!
        image = info[.originalImage] as? UIImage
        self.imageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }

}
