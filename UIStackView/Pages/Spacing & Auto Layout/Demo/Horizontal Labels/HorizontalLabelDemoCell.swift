import UIKit
import SnapKit

final class HorizontalLabelDemoCell: UITableViewCell {
	private lazy var stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.distribution = .fill
		stackView.spacing = 8.0
		return stackView
	}()
	
	lazy var leftLabel: UILabel = {
		let label = UILabel()
		label.textColor = ColorPalette.primaryText
		label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
		label.backgroundColor = UIColor.systemRed.withAlphaComponent(0.4)
		label.layer.cornerRadius = 4.0
		label.layer.masksToBounds = true
		return label
	}()
	
	lazy var rightLabel: UILabel = {
		let label = UILabel()
		label.textColor = ColorPalette.primaryText
		label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
		label.textAlignment = .right
		label.numberOfLines = 0
		label.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.4)
		label.layer.cornerRadius = 4.0
		label.layer.masksToBounds = true
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		selectionStyle = .none
		
		contentView.addSubview(stackView)
		stackView.snp.makeConstraints { make in
			make.leading.trailing.equalToSuperview()
			make.top.bottom.equalToSuperview().inset(4.0)
		}
		
		[leftLabel, rightLabel].forEach { stackView.addArrangedSubview($0) }
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
