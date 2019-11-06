//
//  DateViewController.swift
//  SimpleFacts
//
//  Created by Kulanthaivel, Myl (.) on 05/11/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class DateViewController: UIViewController {
    
    let viewModel: DateViewModel
    
    init(viewModel: DateViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var appTitle: UILabel = {
        var title = UILabel()
        title.text = "Date Fact"
        title.font = UIFont(name:"Optima-Regular", size: 24)
        return title
    }()
    
    
    var dateLabel: UILabel = {
        var dateTitle = UILabel()
        dateTitle.text = "Date"
        dateTitle.font = UIFont(name:"Optima-Regular", size: 24)
        return dateTitle
    }()
    
    
    var monthLabel: UILabel = {
        var monthTitle = UILabel()
        monthTitle.text = "Month"
        monthTitle.font = UIFont(name: "Optima-Regular", size: 24)
        return monthTitle
    }()
    
    var date: UITextField = {
        var date = UITextField()
        date.placeholder = "pick date"
        date.backgroundColor = UIColor.white
        date.font = UIFont(name:"Optima-Regular", size: 13)
        return date
    }()
    
    var month: UITextField = {
        var month = UITextField()
        month.placeholder = "between 1 - 12"
        month.font = UIFont(name:"Optima-Regular", size: 13)
        month.backgroundColor = UIColor.white
        return month
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
//        createDatePicker()
//        date.inputView = datePicker
        
        view.backgroundColor = .gray
        
        view.addSubview(appTitle)
        appTitle.snp.makeConstraints { (make) in
            make.top.equalTo(150)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(dateLabel)
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(appTitle.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(50)
        }
        
        view.addSubview(monthLabel)
        monthLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.top.equalTo(320)
            make.leading.equalToSuperview().offset(50)
        }
        
        view.addSubview(date)
        date.snp.makeConstraints { (make) in
            make.top.equalTo(appTitle.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(180)
            make.height.equalTo(30)
        }
        
        view.addSubview(month)
        month.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(180)
            make.height.equalTo(30)
        }
        
        view.addSubview(generate)
        generate.snp.makeConstraints { (make) in
            make.top.equalTo(month.snp.bottom).offset(30)
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
        let dateValue = date.text!
        let monthValue = month.text!
        let date = "date"
        viewModel.getDateData(dateSelected: dateValue, monthSelected: monthValue, typeOfInput: date) { (factModel, error) in
            DispatchQueue.main.async {
                guard let factModel = factModel else {
                    let alert = UIAlertController(title: "Enter a valid date and month to generate a fact", message: "", preferredStyle: .alert)
                    let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(alertAction)
                    self.present(alert, animated: true, completion: nil)
                    
                    return }
                self.factResult.text = "Fact:  \(factModel.text) \n\nYear:  \(factModel.year ?? 11)"
                
            }
        }
    }
}

protocol GenerateFact: class{
    func generate()
}
