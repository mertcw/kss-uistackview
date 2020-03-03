import UIKit

final class MainAxisDistributionViewController: BasePageViewController {
	override var contentList: [Content] {
		return [
			.textContent(.body("When we layout views, we’re accustomed to thinking in terms of origin and size. Working with stack views, however, requires us to instead think in terms of main axis and cross axis.")),
			.image("mad_01"),
			.textContent(.body("Consider how a horizontally-oriented stack view works. To determine the width and the x coordinate of the origin for each of its arranged subviews, it refers to a set of properties that affect layout across the horizontal axis. Likewise, to determine the height and the y coordinate, it refers to another set of properties that affects the vertical axis.\n\nThe UIStackView class provides axis-specific properties to define the layout: distribution for the main axis, and alignment for the cross axis.")),
			.spacing(40.0),
			.textContent(.title1("The Main Axis: Distribution")),
			.spacing(20.0),
			.textContent(.body("The position and size of arranged subviews along the main axis is affected in part by the value of the distribution property, and in part by the sizing properties of the subviews themselves.\n\nIn practice, each distribution option will determine how space along the main axis is distributed between the subviews. With all distributions, save for fillEqually, the stack view attempts to find an optimal layout based on the intrinsic sizes of the arranged subviews. When it can’t fill the available space, it stretches the arranged subview with the the lowest content hugging priority. When it can’t fit all the arranged subviews, it shrinks the one with the lowest compression resistance priority. If the arranged subviews share the same value for content hugging and compression resistance, the algorithm will determine their priority based on their indices.")),
			.spacing(20.0),
			.textContent(.body("With that out of the way, let’s take a look at the possible outcomes, staring the distributions that prioritize preserving the intrinsic content size of each arranged subview:\n\n\t⦁ equalSpacing: The stack view gives every arranged subview its intrinsic size alongside the main axis, then introduces equally-sized paddings if there is extra space.\n\t⦁ equalCentering: Similar to equalSpacing, but instead of spacing subviews equally, a variably sized padding is introduced in-between so as the center of each subview alongside the axis is equidistant from the two adjacent subview centers.")),
			.spacing(50.0),
			.image("mad_02"),
			.image("mad_03"),
			.spacing(40.0),
			.textContent(.body("In contrast, the following distributions prioritize filling the stack container, regardless of the intrinsic content size of its subviews:\n\n\t⦁ fill (default): The stack view ensures that the arranged subviews fill all the available space. The rules mentioned above apply.\n\t⦁ fillProportionally: Similar to fill, but instead of resizing a single view to fill the remaining space, the stack view proportionally resizes all subviews based on their intrinsic content size.\n\t⦁ fillEqually: The stack view ensures that the arranged views fill all the available space and are all the same size along the main axis.")),
			.spacing(50.0),
			.image("mad_04"),
			.image("mad_05"),
			.image("mad_06"),
			.spacing(40.0),
		]
	}
	
	override func loadView() {
		super.loadView()
		title = "Distribution"
	}
}
