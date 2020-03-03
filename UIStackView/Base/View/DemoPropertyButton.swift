import UIKit

final class DemoPropertyButton: UIButton {
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		layer.cornerRadius = 16.0
		layer.masksToBounds = true
		
		titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
		titleLabel?.numberOfLines = 0
		titleLabel?.adjustsFontSizeToFitWidth = true
		titleLabel?.textAlignment = .center
		
		adjustsImageWhenHighlighted = false
		
		backgroundColor = UIColor.systemGray3
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override var isSelected: Bool {
		didSet {
			if isSelected {
				backgroundColor = UIColor.systemGray
			} else {
				backgroundColor = UIColor.systemGray3
			}
		}
	}
}
