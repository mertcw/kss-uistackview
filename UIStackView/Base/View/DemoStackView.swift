import UIKit
import SnapKit

class DemoStackView: UIStackView {
	init(numberOfItems: Int) {
		super.init(frame: .zero)
		
		axis = .horizontal
		distribution = .fillEqually
		
		for index in 0..<numberOfItems {
			let colorIndex = (index % UIColor.allSystemColors.count)
			let view = DemoView(frame: .zero)
			view.backgroundColor = UIColor.allSystemColors[colorIndex]
			addArrangedSubview(view)
		}
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Demo Views
private extension DemoStackView {
	
}
