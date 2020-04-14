//
//  ClipImageViewController.m
//  Unity-iPhone
//
//  Created by aimin on 2020/4/2.
//

#import "ClipImageViewController.h"
#import "HQImageEditViewController.h"

@interface ClipImageViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate, HQImageEditViewControllerDelegate>

@end

@implementation ClipImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
}


/// 图片选择代理
/// @param picker 图片选择器
/// @param info 图片信息
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    // 获取原图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    if (self.clipWidth == 0 || self.clipHeight == 0) {
        const char* imagePath = [self saveImage:image];
        if (self.pickCompletion) {
            self.pickCompletion(-1, imagePath);
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }else
    {
        HQImageEditViewController *vc = [[HQImageEditViewController alloc] init];
        vc.originImage = image;
        vc.delegate = self;
        vc.maskViewAnimation = YES;
        vc.editViewSize = CGSizeMake(self.clipWidth, self.clipHeight);
        
        [self pushViewController:vc animated:YES];
    }
}



/// 点击取消按钮
/// @param picker 选择
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if (self.pickCompletion) {
        self.pickCompletion(0,"");
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (const char*) saveImage: (UIImage *)image {
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"avatar.jpg"];
    [imageData writeToFile:filePath atomically:YES];
    
    return [filePath UTF8String];
}

- (void)editController:(nonnull HQImageEditViewController *)vc finishiEditShotImage:(nonnull UIImage *)image originSizeImage:(nonnull UIImage *)originSizeImage {
    const char* imagePath = [self saveImage:image];
    if (self.pickCompletion) {
        self.pickCompletion(-1,imagePath);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)editControllerDidClickCancel:(nonnull HQImageEditViewController *)vc {
    if (self.pickCompletion) {
        self.pickCompletion(0,"");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (int) clipWidth {
    if (_clipWidth && _clipWidth != 0) {
        return _clipWidth;
    }
    return 0;
}

- (int) clipHeight {
    if (_clipHeight && _clipHeight != 0) {
        return _clipWidth;
    }
    return 0;
}

- (BOOL)allowsEditing {
    return NO;
}

@end
