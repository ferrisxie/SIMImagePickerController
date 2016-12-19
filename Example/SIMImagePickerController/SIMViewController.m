//
//  SIMViewController.m
//  SIMImagePickerController
//
//  Created by XFerris on 12/19/2016.
//  Copyright (c) 2016 XFerris. All rights reserved.
//

#import "SIMViewController.h"
#import "SIMImagePickerController.h"
@interface SIMViewController ()
{
    UIImageView* _pickedImageView;
}
@end

@implementation SIMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton* pickerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    pickerButton.frame = CGRectMake(20, 400, 300, 80);
    [pickerButton setTitle:@"Pick a image" forState:UIControlStateNormal];
    [pickerButton addTarget:self action:@selector(showImagePickerController:) forControlEvents:UIControlEventTouchUpInside];
    _pickedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 380)];
    [self.view addSubview:_pickedImageView];
    [self.view addSubview:pickerButton];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)showImagePickerController:(UIButton*)button
{
    SIMImagePickerController* picker = [[SIMImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;//On simulator
    picker.doneButton.title = @"确定";
    [picker setSim_didFinishPickingImageBlock:^(UIImagePickerController *picker, NSDictionary *info) {
        UIImage* image = info[UIImagePickerControllerOriginalImage];
        _pickedImageView.image = image;
    }];
    [self presentViewController:picker animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
