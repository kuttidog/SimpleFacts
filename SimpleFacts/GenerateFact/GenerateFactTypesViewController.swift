//
//  GenerateFactTypes.swift
//  SimpleFacts
//
//  Created by Kulanthaivel, Myl (.) on 05/11/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class GenerateFactTypesViewController: UIViewController {
    
    var delegate: GenerateFactCoordinatableDelegate?
    
    var appTitle: UILabel = {
        var title = UILabel()
        title.text = "Choose an option below to generate a Fact"
        title.font = UIFont(name:"Optima-Regular", size: 18)
        return title
    }()
    
    var date:UIButton = {
        var conBtn = UIButton()
        conBtn.setTitle("Date Fact", for: .normal)
        conBtn.backgroundColor = UIColor.orange
        conBtn.layer.cornerRadius = 10
        conBtn.layer.borderColor = UIColor.gray.cgColor
        // conBtn.layer.borderWidth = 1.0
        conBtn.setTitleShadowColor(UIColor.black, for: .normal)
        conBtn.addTarget(self, action: #selector(date(sender:)), for: .touchUpInside)
        return conBtn
    }()
    
    var mathFact:UIButton = {
        var conBtn = UIButton()
        conBtn.setTitle("Math Fact", for: .normal)
        conBtn.backgroundColor = UIColor.orange
        conBtn.layer.cornerRadius = 10
        conBtn.layer.borderColor = UIColor.gray.cgColor
        // conBtn.layer.borderWidth = 1.0
        conBtn.setTitleShadowColor(UIColor.black, for: .normal)
        conBtn.addTarget(self, action: #selector(mathFact(sender:)), for: .touchUpInside)
        return conBtn
    }()
    
    var yearFact:UIButton = {
        var conBtn = UIButton()
        conBtn.setTitle("Year Fact", for: .normal)
        conBtn.backgroundColor = UIColor.orange
        conBtn.layer.cornerRadius = 10
        conBtn.layer.borderColor = UIColor.gray.cgColor
        // conBtn.layer.borderWidth = 1.0
        conBtn.setTitleShadowColor(UIColor.black, for: .normal)
        conBtn.addTarget(self, action: #selector(yearFact(sender:)), for: .touchUpInside)
        return conBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        backgroundGradient()
        
        view.addSubview(appTitle)
        appTitle.snp.makeConstraints { (make) in
            make.top.equalTo(150)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(date)
        date.snp.makeConstraints { (make) in
            make.top.equalTo(appTitle.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        
        view.addSubview(mathFact)
        mathFact.snp.makeConstraints { (make) in
            make.top.equalTo(date.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        view.addSubview(yearFact)
        yearFact.snp.makeConstraints { (make) in
            make.top.equalTo(mathFact.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
    }
    
    @objc func date(sender: UIButton) {
        delegate?.date()
    }
    
    
    @objc func mathFact(sender: UIButton) {
        delegate?.mathFact()
    }
    
    @objc func yearFact(sender: UIButton) {
        delegate?.yearFact()
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

protocol GenerateFactCoordinatableDelegate: class {
    func date()
    func mathFact()
    func yearFact()
}


