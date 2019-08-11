//
// Created by Murakumo on 2019-08-11.
// Copyright (c) 2019 crome110. All rights reserved.
//

import Foundation

class ScaleRoot: Scale {
    static let root = ScaleRoot()

    override var parent: Scale? {
        get {
            return nil
        }
        set {
            print("[Scale Editor] It is not accepted to set ScaleRoot.parent")
        }
    }

    private init() {
        super.init(parent: nil, children: [])
    }
}
