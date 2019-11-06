//
//  HomeViewCoordinator.swift
//  SimpleFacts
//
//  Created by Kulanthaivel, Myl (.) on 05/11/19.
//  Copyright © 2019 Kulanthaivel, Myl (.). All rights reserved.
//

import Foundation
import UIKit


protocol Coordinator {
    
    func start()
}
class HomeCoordinator: Coordinator {
    
    private let router: UINavigationController
    var co: GenerateFactTypesCoordinator!
    init(router: UINavigationController = UINavigationController()) {
        self.router = router
    }
    
    func start() {
        let vc = HomeViewController()
        vc.delegate = self
        router.pushViewController(vc, animated: true)
    }
}

extension HomeCoordinator: HomeCoordinatableDelegate  {
    func startFactGenerator() {
        co = GenerateFactTypesCoordinator(router: router)
        let vc = GenerateFactTypesViewController()
        vc.delegate = co
        router.pushViewController(vc, animated: true)
    }
    

    
}
