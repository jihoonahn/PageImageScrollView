import UIKit

public final class PageImageScrollView : UIView{
        
    public var images : [UIImage?]
    public var pageIndicatorTintColor : UIColor?
    public var currentPageIndicatorTintColor : UIColor?
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.isScrollEnabled = true
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.alwaysBounceVertical = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    required init?(coder: NSCoder) {
        self.images = [UIImage()]
        super.init(coder: coder)
    }
    
    public init(
        pageIndicatorTintColor : UIColor? = nil,
        currentPageIndicatorTintColor : UIColor? = nil,
        images : [UIImage?]? = nil
    ){
        self.images = images ?? [UIImage()]
        self.pageIndicatorTintColor = pageIndicatorTintColor
        self.currentPageIndicatorTintColor = currentPageIndicatorTintColor
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        configureUI()
        scrollView.delegate = self
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            pageControl.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 30),
            pageControl.heightAnchor.constraint(equalToConstant: 30),
            pageControl.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
        addContentScrollView()
        setupAfterViewDidLoad()
    }
    
    //MARK: - Private
    
    private func configureUI(){
        addSubview(scrollView)
        addSubview(pageControl)
    }
    
    private func addContentScrollView(){
        for i in 0..<images.count {
            let imageView = UIImageView()
            let xPos = self.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            imageView.image = images[i]
            scrollView.addSubview(imageView)
            scrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
        }
    }
    private func setupAfterViewDidLoad(){
        self.pageControl.pageIndicatorTintColor = pageIndicatorTintColor
        self.pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor
        self.pageControl.numberOfPages = images.count
    }
}
extension PageImageScrollView : UIScrollViewDelegate{
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        pageControl.currentPage = Int(round(value))
    }
}

