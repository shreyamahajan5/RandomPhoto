//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Shreya Mahajan on 28/12/22.
//

import UIKit

class ViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Next wallpaper", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemFill
        // Do any additional setup after loading the view.
        
        
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width:400, height: 700)
        imageView.center = view.center
        view.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
    }
    
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
       
        button.frame = CGRect(x: 20,
                              y: view.frame.size.height-10-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-40,
                              height: 40)
        
    }
    
 func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/?wallpaper/"
        let url = URL(string: urlString)!
        guard let data = try?  Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data:data)
        
    }

}

