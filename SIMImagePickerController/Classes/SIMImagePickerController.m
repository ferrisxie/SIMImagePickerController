//
//  SIMImagePickerController.m
//  Pods
//
//  Created by Ferris on 2016/12/19.
//
//

#import "SIMImagePickerController.h"
#import "MWPhotoBrowser.h"
@interface SIMImagePickerController ()<UIImagePickerControllerDelegate>
{
    NSDictionary<NSString*,id> *_info;
}
@end

@implementation SIMImagePickerController
- (instancetype)init
{
    if(self = [super init])
    {
        self.doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(finishPickerImage:)];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    self.allowsEditing = NO;
}
#pragma mark - UIImagePickerControllerDelegate
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    if(self.sim_didCancelBlock)
    {
        _sim_didCancelBlock(picker);
    }
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage* pickedImage = info[UIImagePickerControllerOriginalImage];
    if(self.sourceType!=UIImagePickerControllerSourceTypeCamera)
    {
        MWPhotoBrowser* photoBrowser = [[MWPhotoBrowser alloc] initWithPhotos:@[[MWPhoto photoWithImage:pickedImage]]];
        photoBrowser.alwaysShowControls = NO;
        photoBrowser.displayActionButton = NO;
        photoBrowser.displayNavArrows = YES;
        [picker pushViewController:photoBrowser animated:YES];
        photoBrowser.navigationItem.rightBarButtonItem = self.doneButton;
    }
    else
    {
        if(_sim_didFinishPickingImageBlock)
        {
            _sim_didFinishPickingImageBlock(self,info);
        }
    }
        _info=[info copy];
    
}
-(void)finishPickerImage:(UIBarButtonItem*)item
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    if(_sim_didFinishPickingImageBlock)
    {
        _sim_didFinishPickingImageBlock(self,_info);
    }
}
#pragma mark - calss method
+(instancetype)imagePickerWithSourceType:(UIImagePickerControllerSourceType)type doneButtonTitle:(NSString *)title completionHandler:(void (^)(UIImage *))handler
{
    SIMImagePickerController* imagePicker = [[SIMImagePickerController alloc] init];
    imagePicker.sourceType = type;
    imagePicker.doneButton.title = title;
    imagePicker.sim_didFinishPickingImageBlock = ^(SIMImagePickerController* picker,NSDictionary<NSString *,id>* info){
        UIImage* image = info[UIImagePickerControllerOriginalImage];
        [picker.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        if(handler)
        {
            handler(image);
        }
    };
    imagePicker.sim_didCancelBlock = ^(SIMImagePickerController* picker){
        [picker.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        
    };

    return imagePicker;
}
+(instancetype)showImagePickerWithSourceType:(UIImagePickerControllerSourceType)type doneButtonTitle:(NSString *)title completionHandler:(void (^)(UIImage *))handler
{
    SIMImagePickerController* picker = [SIMImagePickerController imagePickerWithSourceType:type doneButtonTitle:title completionHandler:handler];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:picker animated:YES completion:nil];
}

@end
