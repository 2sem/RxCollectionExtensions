//
//  MainViewModel.swift
//  ExampleApp
//
//  Created by 영준 이 on 2021/02/13.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import RxSwift

class MainViewModel{
    var items : BehaviorSubject<[ItemInfo]> = .init(value: []);
    
    func load(){
        let values : [ItemInfo] = (1...30).map{ ItemInfo.init(name: "Item \($0)") };
        
        self.items.onNext(values);
    }
}
