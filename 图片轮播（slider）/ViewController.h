//
//  ViewController.h
//  图片轮播（slider）
//
//  Created by Zhang Xiangyu on 16/4/8.
//  Copyright © 2016年 Zhang Xiangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
{
    NSArray *arrImages;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

