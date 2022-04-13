import UIKit

public final class PageImageScrollView : UIView{
        
    private let images : [UIImage?]
    
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
        pageControl.numberOfPages = images.count
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    required init?(coder: NSCoder) {
        self.images = [UIImage()]
        super.init(coder: coder)
    }
    
    public init(
        frame : CGRect,
        pageIndicatorTintColor : UIColor? = nil,
        currentPageIndicatorTintColor : UIColor? = nil,
        images : [UIImage?]
    ){
        self.images = images
        super.init(frame: frame)
        self.pageControl.pageIndicatorTintColor = pageIndicatorTintColor
        self.pageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor
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
            
            pageControl.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10),
            pageControl.heightAnchor.constraint(equalToConstant: 30),
            pageControl.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
        addContentScrollView()
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
}
extension PageImageScrollView : UIScrollViewDelegate{
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/scrollView.frame.size.width
        pageControl.currentPage = Int(round(value))

    }
}

