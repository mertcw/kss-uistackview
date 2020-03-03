import UIKit
import SnapKit

final class NoteView: UIView {
	lazy var stackView: UIStackView = {
        let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.distribution = .fill
		stackView.spacing = 16.0
        return stackView
    }()
	
	lazy var headerLabel: UILabel = {
		let label = UILabel()
		label.backgroundColor = ColorPalette.noteBackground
		label.font = UIFont.preferredFont(forTextStyle: .title3, weight: .bold)
		label.textColor = ColorPalette.primaryText
		label.text = "Note"
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	lazy var bodyLabel: UILabel = {
		let label = UILabel()
		label.backgroundColor = ColorPalette.noteBackground
		label.font = UIFont.preferredFont(forTextStyle: .body)
		label.textColor = ColorPalette.primaryText
		label.textAlignment = .justified
		label.numberOfLines = 0
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	// MARK: - Constructors
	init(note: String) {
		super.init(frame: CGRect.zero)
		layer.cornerRadius = 6.0
		layer.masksToBounds = true
		backgroundColor = ColorPalette.noteBackground
		
		addSubview(stackView)
		stackView.snp.makeConstraints { make in
			let insets = UIEdgeInsets(top: 16.0, left: 24.0, bottom: 16.0, right: 24.0)
			make.edges.equalToSuperview().inset(insets)
		}
		
		stackView.addArrangedSubview(headerLabel)
		stackView.addArrangedSubview(bodyLabel)
		
		bodyLabel.text = note
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
