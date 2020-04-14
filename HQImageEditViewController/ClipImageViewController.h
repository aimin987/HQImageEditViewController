//
//  ClipImageViewController.h
//  Unity-iPhone
//
//  Created by aimin on 2020/4/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClipImageViewController : UIImagePickerController

@property (nonatomic, copy) void (^pickCompletion)(const int resultCode, const char* imagePath);

@property (nonatomic, assign) int clipWidth;
@property (nonatomic, assign) int clipHeight;

@end

NS_ASSUME_NONNULL_END
