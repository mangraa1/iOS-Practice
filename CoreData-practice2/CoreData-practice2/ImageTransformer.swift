//
//  ImageTransformer.swift
//  CoreData-practice2
//
//  Created by mac on 04.10.2023.
//

import UIKit

class ImageTransformer: ValueTransformer {

    override func transformedValue(_ value: Any?) -> Any? {

        guard let image = value as? UIImage else { return nil }

        let data = image.pngData()

        return data
    }

    override func reverseTransformedValue(_ value: Any?) -> Any? {

        guard let data = value as? Data else { return nil }

        return UIImage(data: data)
    }
}
