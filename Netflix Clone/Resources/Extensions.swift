//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Ad on 3/6/23.
//

import Foundation


extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
