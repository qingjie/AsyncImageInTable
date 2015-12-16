//
//  ViewController.m
//  AsyncImageInTable
//
//  Created by qingjie on 12/15/15.
//  Copyright © 2015 Retrieve LLC. All rights reserved.
//

#import "ViewController.h"


@interface ViewController (){
    
    
}
@end

@implementation ViewController

NSArray *_imageURLs = nil;


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tbView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"TableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSArray *)imageURLs
{
    if (!_imageURLs)
    {
        NSMutableArray *imageURLs = [NSMutableArray array];
        
        for (int index = 0; index < 100; ++index)
        {
            [imageURLs addObject:[NSString stringWithFormat:
                                  @"http://dummyimage.com/88/%06X/%06X&text=%d",
                                  arc4random() % 0xFFFFFF,
                                  arc4random() % 0xFFFFFF,
                                  index + 1]];
        }
        
        _imageURLs = imageURLs;
    }
    
    return _imageURLs;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.imageURLs count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = @"Hello";
    cell.detailTextLabel.text = @"World";
    cell.imageView.image = [UIImage imageNamed:@"placeholder"];
    
    //1
    //[cell.imageView setImageWithURL:[NSURL URLWithString:self.imageURLs[indexPath.row]]];
    
    
//2
//    [self.operationManager GET:self.imageURLs[indexPath.row]
//                    parameters:nil
//                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                           cell.imageView.image = responseObject;
//                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                           NSLog(@"Failed with error %@.", error);
//                       }];
    
    //3
    NSString *url = self.imageURLs[indexPath.row];
    cell.imageView.associatedObject = url;
    
    [self.operationManager GET:url
                    parameters:nil
                       success:^(AFHTTPRequestOperation *operation, id responseObject) {
                           if ([cell.imageView.associatedObject isEqualToString:url])
                           {
                               cell.imageView.image = responseObject;
                           }
                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                           NSLog(@"Failed with error %@.", error);
                       }];
    
    
    return cell;
}

- (AFHTTPRequestOperationManager *)operationManager
{
    if (!operationManager)
    {
        operationManager = [[AFHTTPRequestOperationManager alloc] init];
        operationManager.responseSerializer = [AFImageResponseSerializer serializer];
    };
    
    return operationManager;
}



@end
