//
//  ViewController.h
//  AsyncImageInTable
//
//  Created by qingjie on 12/15/15.
//  Copyright © 2015 Retrieve LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPRequestOperationManager.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "NSObject+Associating.h"


@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>{

    AFHTTPRequestOperationManager *operationManager;
    UIImageView *imageView;
}

@property (strong, nonatomic) IBOutlet UITableView *tbView;



@end

