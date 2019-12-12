//
// Created by Vijay Vepakomma on 12/5/19.
// Copyright (c) 2019 Vijay Vepakomma. All rights reserved.
//

import Foundation

public struct  PageInfo{
    let id: String
    let type: AnyClass

    public init(id: String, type: AnyClass){
        self.id = id
        self.type = type
    }
}