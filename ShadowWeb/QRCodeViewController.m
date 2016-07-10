//
// Created by clowwindy on 14-2-17.
// Copyright (c) 2014 clowwindy. All rights reserved.
//

#import "QRCodeViewController.h"


@implementation QRCodeViewController {
    QRCodeViewControllerReturnBlock returnBlock;
    UIView *cameraView;
    UIButton *cancelButton;
    BOOL stopped;
}

- (id)initWithReturnBlock:(QRCodeViewControllerReturnBlock)block {
    self = [super init];
    if (self) {
        returnBlock = block;
        stopped = NO;
    }
    return self;
}

- (void)viewDidLoad {
    cameraView = [[UIView alloc] initWithFrame:self.view.bounds];
    cameraView.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin |
            UIViewAutoresizingFlexibleBottomMargin |
            UIViewAutoresizingFlexibleLeftMargin |
            UIViewAutoresizingFlexibleRightMargin |
            UIViewAutoresizingFlexibleWidth |
            UIViewAutoresizingFlexibleHeight);
    cameraView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:cameraView];

    cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - 44 - 10, 20, 44, 44)];
    [cancelButton setImage:[UIImage imageNamed:@"cancel"] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelButton];
}

- (void)cancel {
    [self dismissModalViewControllerAnimated:YES];
}

@end