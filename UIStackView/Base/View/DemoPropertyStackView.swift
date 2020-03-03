import UIKit

class DemoPropertyStackView: UIStackView {
	weak var delegate: DemoPropertyStackViewDelegate?

	private let titles: [String]
	
	var isSelectionEnabled: Bool = true
	
	init(titles: [String]) {
		self.titles = titles
		super.init(frame: .zero)
		
		spacing = 32.0
		axis = .horizontal
		distribution = .fillEqually
		isUserInteractionEnabled = true
		
		let buttons: [DemoPropertyButton] = titles.map { title in
			let button = DemoPropertyButton()
			button.setTitle(title, for: .normal)
			button.addTarget(
				self,
				action: #selector(buttonDidReceiveTap(_:)),
				for: .touchUpInside)
			return button
		}
		
		buttons.forEach { addArrangedSubview($0) }
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func selectButton(atIndex index: Int) {
		guard let buttons = arrangedSubviews as? [DemoPropertyButton] else { return }
		buttons.forEach { $0.isSelected = false }
		
		guard isSelectionEnabled else { return }
		buttons[index].isSelected = true
	}
}

// MARK: - DemoPropertyStackViewDelegate
@objc protocol DemoPropertyStackViewDelegate: AnyObject {
	func propertyStackView(
		propertyStackView: DemoPropertyStackView,
		didReceiveTapAt index: Int)
}

// MARK: - Button
private extension DemoPropertyStackView {
	@objc func buttonDidReceiveTap(_ button: UIButton) {
		guard let index = arrangedSubviews.firstIndex(of: button) else { return }
		selectButton(atIndex: index)
		delegate?.propertyStackView(propertyStackView: self, didReceiveTapAt: index)
	}
}
