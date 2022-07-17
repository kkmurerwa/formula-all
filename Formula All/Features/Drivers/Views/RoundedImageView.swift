//
//  CircularImageView.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 16/07/2022.
//

import UIKit

class RoundedImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        clipsToBounds = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        clipsToBounds = true
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        assert(bounds.height == bounds.width, "The aspect ratio isn't 1/1. You can never round this image view!")

        layer.cornerRadius = bounds.height / 2
    }
}
