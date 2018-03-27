//
//  ViewController.m
//  图片轮播（slider）
//
//  Created by Zhang Xiangyu on 16/4/8.
//  Copyright © 2016年 Zhang Xiangyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrImages = @[@"img0.jpg",@"img1.jpg",@"img2.jpg",@"img3.jpg"];
    
    for (int i = 0;i < arrImages.count;i++)
    {
        UIImageView *imageView = [[UIImageView alloc] init];

        imageView.frame = CGRectMake(i * self.scrollView.frame.size.width , 0,self.scrollView.frame.size.width, self.scrollView.frame.size.height);
        
        imageView.image = [UIImage imageNamed:[arrImages objectAtIndex:i]];
        [self.scrollView addSubview:imageView];
    }
    
    self.scrollView.contentSize = CGSizeMake(4 * self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    
    self.scrollView.pagingEnabled = YES;

    self.scrollView.delegate = self;
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.f target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];

}


- (void)nextPage
{
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width * ((++self.pageControl.currentPage) % 4), 0.f) animated:YES];
}


#pragma mark -- scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = self.scrollView.contentOffset.x;
    int pageNumber = (offsetX + 0.5* self.scrollView.frame.size.width) / self.scrollView.frame.size.width;
    self.pageControl.currentPage = pageNumber;
}




@end


