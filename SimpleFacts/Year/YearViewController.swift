//
//  YearViewController.swift
//  SimpleFacts
//
//  Created by Kulanthaivel, Myl (.) on 06/11/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class YearViewController: UIViewController {
    
    let yearModel: YearViewModel
    weak var delegate: GenerateYearFact?
    
    init(yearModel: YearViewModel) {
        self.yearModel = yearModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dateFact: GenerateFactCoordinatableDelegate?
    
    var appTitle: UILabel = {
        var title = UILabel()
        title.text = "Year Fact"
        title.font = UIFont(name:"Optima-Regular", size: 24)
        return title
    }()
    
    
    var numberLabel: UILabel = {
        var numberTitle = UILabel()
        numberTitle.text = "Year"
        numberTitle.font = UIFont(name:"Optima-Regular", size: 24)
        return numberTitle
    }()
    
    
    
    var date: UITextField = {
        var date = UITextField()
        date.placeholder = "enter only Year"
        date.backgroundColor = UIColor.white
        date.font = UIFont(name:"Optima-Regular", size: 13)
        return date
    }()
    
    
    var generate:UIButton = {
        var conBtn = UIButton()
        conBtn.setTitle("Generate", for: .normal)
        conBtn.backgroundColor = UIColor.orange
        conBtn.layer.cornerRadius = 10
        conBtn.layer.borderColor = UIColor.gray.cgColor
        // conBtn.layer.borderWidth = 1.0
        conBtn.setTitleShadowColor(UIColor.black, for: .normal)
        conBtn.addTarget(self, action: #selector(generate(sender:)), for: .touchUpInside)
        return conBtn
    }()
    
    var factResult: UILabel = {
        var fact = UILabel()
        //        fact.backgroundColor = UIColor.white
        fact.numberOfLines = 0
        return fact
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
        
        view.addSubview(appTitle)
        appTitle.snp.makeConstraints { (make) in
            make.top.equalTo(150)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(appTitle.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(180)
            make.height.equalTo(30)
        }
        
        view.addSubview(date)
        date.snp.makeConstraints { (make) in
            make.top.equalTo(appTitle.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(180)
            make.height.equalTo(30)
        }
        
        view.addSubview(generate)
        generate.snp.makeConstraints { (make) in
            make.top.equalTo(date.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
        }
        
        view.addSubview(factResult)
        factResult.snp.makeConstraints { (make) in
            make.top.equalTo(generate.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(400)
            make.height.equalTo(400)
        }
        
    }
    
    @objc func generate(sender: UIButton) {
        guard let numberString = date.text else {
            fatalError()
        }
        guard let number = Int(numberString) else {
            
            let alert = UIAlertController(title: "Enter Year to generate a fact", message: "", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            return
        }
        let appendString = "year"
        yearModel.getYearData(entertedNumber: number, typeOfInput: appendString) { (factModel, error) in
            DispatchQueue.main.async {
                guard let factModel = factModel else { return }
                self.factResult.text = "Fact:  \(factModel.text)"
            }
        }
    }
}

protocol GenerateYearFact: class{
    func generateYearFact()
}
