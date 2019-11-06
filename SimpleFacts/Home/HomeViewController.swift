//
//  ViewController.swift
//  SimpleFacts
//
//  Created by Kulanthaivel, Myl (.) on 05/11/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//


import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    weak var delegate: HomeCoordinatableDelegate?
    
    var appTitle:UILabel = {
        var title = UILabel()
        title.text = "Fact Generator"
        title.font = UIFont(name:"Optima-Regular", size: 26)
        return title
    }()
    
    var startFactGen:UIButton = {
        var conBtn = UIButton()
        conBtn.setTitle("start", for: .normal)
        conBtn.backgroundColor = UIColor.orange
        conBtn.layer.cornerRadius = 10
        conBtn.layer.borderColor = UIColor.gray.cgColor
        // conBtn.layer.borderWidth = 1.0
        conBtn.setTitleShadowColor(UIColor.black, for: .normal)
        conBtn.addTarget(self, action: #selector(startFactGen(sender:)), for: .touchUpInside)
        
        return conBtn
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        backgroundGradient()
        
        view.addSubview(appTitle)
        appTitle.snp.makeConstraints { (make) in
            make.top.equalTo(250)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(startFactGen)
        startFactGen.snp.makeConstraints { (make) in
            make.top.equalTo(appTitle.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
    }
    
    @objc func startFactGen(sender: UIButton) {
        delegate?.startFactGenerator()
    }
    
    func backgroundGradient() {
        let layer           = CAGradientLayer()
        layer.frame         = view.bounds
        layer.colors        = [UIColor.yellow.cgColor,UIColor.green.cgColor]
        layer.startPoint    = CGPoint(x: 0,y: 1)
        layer.endPoint      = CGPoint(x: 1,y: 2)
        view.layer.addSublayer(layer)
    }
    
}

protocol HomeCoordinatableDelegate: class {
    func startFactGenerator()
}
