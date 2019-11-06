//
//  GenerateFactTypesCoordinator.swift
//  SimpleFacts
//
//  Created by Kulanthaivel, Myl (.) on 05/11/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation
import UIKit

class GenerateFactTypesCoordinator: Coordinator {
    private let router: UINavigationController
    init(router: UINavigationController) {
        self.router = router
    }
    
    func start() {
        let vc = GenerateFactTypesViewController()
        vc.delegate = self
        router.pushViewController(vc, animated: true)
    }
}

extension GenerateFactTypesCoordinator: GenerateFactCoordinatableDelegate {
    func date() {
        
        let vc = DateViewController(viewModel: DateViewModel())
        router.pushViewController(vc, animated: true)
    }
    
    func mathFact() {
        let vc = NumberViewController(numberModel: NumberViewModel())
        router.pushViewController(vc, animated: true)
    }
    
    func yearFact() {
        let vc = YearViewController(yearModel: YearViewModel())
        router.pushViewController(vc, animated: true)
    }
    
    

}
