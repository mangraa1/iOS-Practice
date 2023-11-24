//
//  Box.swift
//  MVVM practice
//
//  Created by mac on 24.11.2023.
//

import Foundation


class Box<T> {

    typealias Listener = (T) -> ()

    private var listener: Listener?

    var value: T {
        didSet {
            listener?(value)
        }
    }

    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }

    init(_ value: T) {
        self.value = value
    }
}
