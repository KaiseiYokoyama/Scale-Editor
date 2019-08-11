//
//  Scale.swift
//  Scale Editor
//
//  Created by Murakumo on 2019/08/10.
//  Copyright © 2019 crome110. All rights reserved.
//

import Foundation

class Scale {
    weak var parent: Scale? {
        willSet (newParent) {
            newParent?.parent = parent
        }
    }

    var children: [Scale] {
        willSet (newChildren) {
            for newChild in newChildren {
                newChild.parent = self
            }
        }
    }

    var summary: String?
    var description: String?
    var title = "sample title"

    init(parent parent: Scale?, children children: [Scale], summary summary: String? = nil, description description: String? = nil) {
        self.parent = parent
        self.children = []
        self.summary = summary
        self.description = description

        self.append(children)
    }

    convenience init(_ parent: Scale) {
        self.init(parent: parent, children: [])
    }
}

/// 木構造
extension Scale {
}

extension Scale {
    func get(_ index: Int) -> Scale? {
        if (0..<self.children.count).contains(index) {
            return self.children[index]
        }
        return nil
    }

    func push(_ child: Scale) {
        child.parent = self
        self.children.append(child)
    }

    func append(_ children: [Scale]) {
        for child in children {
            self.push(child)
        }
    }

    func remove(at index: Int) -> Scale {
        return self.children.remove(at: index)
    }

    func indexOf(_ child: Scale) -> Int? {
        for i in 0...self.children.count {
            if let item = self.get(i) {
                if item === child {
                    return i
                }
            }
        }
        return nil
    }
}

extension Scale: Collection {
    typealias Index = Int
    typealias Element = Scale

    public var startIndex: Index {
        return 0
    }

    public var endIndex: Index {
        return self.children.count
    }

    public subscript(position: Index) -> Element {
        return self.children[position]
    }

    public func index(after i: Index) -> Index {
        return i + 1
    }
}
