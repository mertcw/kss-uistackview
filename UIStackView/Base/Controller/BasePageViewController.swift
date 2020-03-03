import UIKit
import SnapKit

class BasePageViewController: BaseScrollViewController {
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.distribution = .fill
		stackView.spacing = defaultItemSpacing
        return stackView
    }()
	
	var contentList: [Content] {
		return []
	}
	
	var defaultItemSpacing: CGFloat = 8.0 {
		didSet {
			stackView.spacing = defaultItemSpacing
		}
	}
	
	var stackSetup: StackSetup {
		return .widthPercentage(0.7)
	}
	
	var contentInset: UIEdgeInsets {
		return UIEdgeInsets(top: 50.0, left: 0.0, bottom: 50.0, right: 0.0)
	}
	
    // MARK: - View Lifecycle
    override func loadView() {
        super.loadView()

        contentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
			make.top.bottom.equalToSuperview().inset(contentInset)
			make.width.equalTo(contentView.snp.width).multipliedBy(stackSetup.percentage)
			make.center.equalToSuperview()
        }
		
		for content in contentList {
			switch content {
			case .textContent(let textContent):
				let label = UILabel()
				label.backgroundColor = ColorPalette.primaryBackground
				label.textColor = ColorPalette.primaryText
				label.attributedText = textContent.attributedText
				label.textAlignment = .justified
				label.numberOfLines = 0
				label.translatesAutoresizingMaskIntoConstraints = false
				
				stackView.addArrangedSubview(label)
			case .spacing(let spacing):
				if let lastView = stackView.arrangedSubviews.last {
					stackView.setCustomSpacing(spacing, after: lastView)
				}
			case .line(let height):
				let view = UIView()
				view.backgroundColor = ColorPalette.primarySeparator
				
				view.snp.makeConstraints { make in
					make.height.equalTo(height)
				}
				
				stackView.addArrangedSubview(view)
			case .image(let imageName):
				let imageView = UIImageView(image: UIImage(named: imageName))
				imageView.backgroundColor = ColorPalette.primaryBackground
				imageView.contentMode = .center
				
				stackView.addArrangedSubview(imageView)
			case .note(let note):
				let noteView = NoteView(note: note)
				
				stackView.addArrangedSubview(noteView)
			}
		}
    }
}

// MARK: - Setup
extension BasePageViewController {
	enum StackSetup {
		case fullWidth
		case widthPercentage(CGFloat)
		
		var percentage: CGFloat {
			switch self {
			case .fullWidth:
				return 1.0
			case .widthPercentage(let percentage):
				return percentage
			}
		}
	}
}

// MARK: - Content
extension BasePageViewController {
	enum Content {
		case textContent(TextContent)
		case spacing(CGFloat)
		case line(CGFloat)
		case image(String)
		case note(String)
	}
	
	enum TextContent {
		case largeTitle(String)
		case title1(String)
		case title2(String)
		case title3(String)
		case headline(String)
		case subheadline(String)
		case body(String)
		case callout(String)
		case footnote(String)
		case caption1(String)
		case caption2(String)
		
		var rawText: String {
			switch self {
			case .largeTitle(let text),
				 .title1(let text),
				 .title2(let text),
				 .title3(let text),
				 .headline(let text),
				 .subheadline(let text),
				 .body(let text),
				 .callout(let text),
				 .footnote(let text),
				 .caption1(let text),
				 .caption2(let text):
				return text
			}
		}
		
		var textAttributes: [NSAttributedString.Key: Any] {
			switch self {
			case .largeTitle:
				return [
					.font: UIFont.preferredFont(forTextStyle: .largeTitle),
					.foregroundColor: ColorPalette.primaryText
				]
			case .title1:
				return [
					.font: UIFont.preferredFont(forTextStyle: .title1),
					.foregroundColor: ColorPalette.primaryText
				]
			case .title2:
				return [
					.font: UIFont.preferredFont(forTextStyle: .title2),
					.foregroundColor: ColorPalette.primaryText
				]
			case .title3:
				return [
					.font: UIFont.preferredFont(forTextStyle: .title3),
					.foregroundColor: ColorPalette.primaryText
				]
			case .headline:
				return [
					.font: UIFont.preferredFont(forTextStyle: .headline),
					.foregroundColor: ColorPalette.primaryText
				]
			case .subheadline:
				return [
					.font: UIFont.preferredFont(forTextStyle: .subheadline),
					.foregroundColor: ColorPalette.primaryText
				]
			case .body:
				return [
					.font: UIFont.preferredFont(forTextStyle: .body),
					.foregroundColor: ColorPalette.primaryText
				]
			case .callout:
				return [
					.font: UIFont.preferredFont(forTextStyle: .callout),
					.foregroundColor: ColorPalette.primaryText
				]
			case .footnote:
				return [
					.font: UIFont.preferredFont(forTextStyle: .footnote),
					.foregroundColor: ColorPalette.primaryText
				]
			case .caption1:
				return [
					.font: UIFont.preferredFont(forTextStyle: .caption1),
					.foregroundColor: ColorPalette.primaryText
				]
			case .caption2:
				return [
					.font: UIFont.preferredFont(forTextStyle: .caption2),
					.foregroundColor: ColorPalette.primaryText
				]
			}
		}

		var attributedText: NSAttributedString? {
			var attributes = textAttributes
			attributes[NSAttributedString.Key.paragraphStyle] = TextContent.paragraphStyle
			return NSAttributedString(string: rawText, attributes: attributes)
		}
		
		static let paragraphStyle: NSParagraphStyle = {
			let style = NSMutableParagraphStyle()
			style.lineSpacing = 6.0
			return style
		}()
	}
}
