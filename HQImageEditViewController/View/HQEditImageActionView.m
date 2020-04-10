//
//  HQEditImageActionView.m
//  CivilAviation
//
//  Created by iOS on 2019/3/29.
//  Copyright © 2019 iOS. All rights reserved.
//

#import "HQEditImageActionView.h"

@interface HQEditImageActionView ()

@property (nonatomic, strong) UIView *line;

@end

@implementation HQEditImageActionView

- (instancetype)init {
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:.85f];
        
        [self addSubview:self.rotateButton];
        [self addSubview:self.cancelButton];
        [self addSubview:self.originButton];
        [self addSubview:self.finishButton];
        
        [self addSubview:self.line];
        
        [self makeConstraints];
    }
    return self;
}

- (void)makeConstraints {
    
    [self.rotateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(@0);
        make.width.equalTo(@(25 + 40));
        make.height.equalTo(@49);
    }];
    
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.width.equalTo(@50);
        make.height.equalTo(@49);
        make.top.equalTo(@49);
    }];
    
    [self.originButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@50);
        make.height.equalTo(@49);
        make.top.equalTo(@49);
        make.centerX.equalTo(@0);
    }];
    
    [self.finishButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-20);
        make.width.equalTo(@50);
        make.height.equalTo(@49);
        make.top.equalTo(@49);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@49);
        make.left.right.equalTo(@0);
        make.height.equalTo(@.7f);
    }];
}

#pragma mrak - event response
- (void)buttonAction:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(action:didClickButton:atIndex:)]) {
        [self.delegate action:self didClickButton:button atIndex:button.tag];
    }
}

#pragma mark - getter & setter
- (UIButton *)rotateButton {
    if (!_rotateButton) {
        _rotateButton = [[UIButton alloc] init];
        
        NSString *rotateImageData = @"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAS8AAAEvCAMAAAAjALfqAAAABGdBTUEAALGPC/xhBQAAAf5QTFRFAAAA////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////C78uugAAAKl0Uk5TAAECAwQGBwgJDA4PEBEUFRYXGRobHB0eHyAhIyUmKCstLi8wMTIzNTY3Ojs8QEJISUxNTk9QUVJTVldZWltcXV5fY2RlaGprbG1ub3BydHV2d3h5e3x9fn+AgYKDhoeIiY2OkJGSlZaam5yfoaSlpqiqra6ytba3ubq8vr/DxMXIycrLzNDR1NbX2Nrc3d7f4uPk5ebo6ers7e7v8PHy8/T19vf4+fz9/vM3maQAAAYYSURBVHja7dz/fxJ1HMDx23I5KMg1MzFrtU2TSFIqc5adZhlqX2xUur6oURYaiGWplVlZq7RC0aVliok4+PyX/VA+PNhn3J163fse93r9POabp7fjcx8ODIOIiIiIiIiIiIiIiIiIiOhmijyEgfP6Np2dQMFpPc9UlMLLaY9NKoWX05JHlMLLaQ98qhReTptfmFZ4OS22s64UXg7r33peKbwcdtuG00rh5bRVx5XCy2nLv1UKL6cNH1QKL6ctKrUUXk6bt/uqUng5LLL9klJ4Oaxv01ml8HJYz9qK6tqVM79MfvP5h6+OLZuHlrFiUjnv4lc7Vy8Is9a1PRs3/X7gubvDvmfjstYPEw/3hG7PZs+0uolObrs3VHs2u+rqJmseHrsdL1f9sS0Wnr/HvdO3QKy2cyA85/sDtwBM1XcPsp5w1aXx8JzHXK1XZ+3Xx8NzPfRs5VaIHb4/PNfbm891k9gxuHh4+frtHx+pdj+NZcOzgo1MONrPGVj51qE/uxxi88OzfHW8X9j7yLs/zvaT59eEaMG/aJ/j/egFW2Z7kdjTFyKx4UPO9wuXfvSX9oe/DtUemZv30/pf0L6unhoN1abFUy7er52z7mcN2OWxUIG5uh+gd81JzebYxnDti/W/5uJ+k7lvXp4p9kq4wDr2emzeH1qwfybYtpCBte292r6f9uTMy4NdYQNzdT/mwGe8aenuft/nZ2zWbggf2H97PY4OlSWnOrymV4YQrGet488rDBztXIctCyGYi8/D9O3tADu3MIxgLj5vtaMD7Ls+g7r1RgfYB5B07+UOsNWQdG9Lu9eF+yDp3q6OU1gvJN1XIPvawV6CxGZZ8WWb198LIenenb+1gR1ExKaljTawpxGxaWOb19kIIjbtD/fmoevuONN2U3UcEZtWtR1g7wFiV9uNeFfuAcSmwQtWsAIgdm22ejXuAsRumd/2Ru7rgNi1zup1eg4gNvX+ZAUbA8SuJ6xeR/Gwq+eEFWzo//lH4ykzm5vwr1zWTN3o8vxFq9fb3ltFzWJVSahaNKM3MH/kouV3HPdaa6RcV3Kql0fcP4X3rb/hQU+1ErN9GYRvtUoJt09isfXx73ioFctfVfJq5N1+du97y6NPeMc1VFEyq7h8ldtqfbBnn8bN1JTUahlXz2SR9bHLPeIabyq5NcddPZdjlocu8YhLyc4V2Kbrj5vy5tNYmaZwr6abP8m51xeQeW9O9TUlvZqbk/6aa7cNH+v3ZCFRUfKruFlWrPh3kX/Qm29Eyasg5OpPK7b+ky8Kj3q0qm8EwquRMGRUUsGoJINrtBUQr9aICK+yCkplCVzRemC86lEBXqYKTqYAr2KAvIoCvLSbz61C0s/7pyLJgvZFqOo/V1w311Ta97nSU7rB/L9HKaU7utICjvu07ghLiTzdy7ixpSDyhJ/VTJUU4ZXUTJb1faqcZioZt8pGNJPlfJ9qQjOVkOta5196ghdeeOGFF1544YUXXnjhhRdeeOGFF1544YUXXnjhhRdeeOGFF1544YUXXnjhhRdeeOGFF1544YUXXnjhhRdeeOGFF1544YUXXnjhhRdeeOGFF1544YUXXnjhhRdeeOGFF1544YUXXnjhhRdeeOGFF1544YUXXnjhhRdeeOGFF1544YUXXnjhhRdeeOGFF1544YUXXnjhhRdeeOGFF1544YUXXnjhhRdeeOGFF1544YUXXnjh5aKcZqqICK6IZrKc71NlNVMlRXglNZNlfZ/K1ExVEOFV0Exm+j5VSjNVKy2AK93STJbyfay4Zio15T9Yeko3WNz//8eqbq5WIennST+SLOiOLlUVcNwXVXAqCvAyA+RlCvCK1gPDVY9KeN0uB8arLGKdM9oKCFdrRMZ1WikgXiUh17WJRiC4GgkhXkY+EF55KVxGrBIArkpMjJcxVBPPVRsyBJVpCudqZgxRjQv3GjeENS75CGuK4zKMjNxzWC1jCGxI6qtkZcgQWSwvceHayMcMqSVK0q4lW6WEIbnRsqTtnXp51JBe1CxWRWBVi2bUCEbxlJnNTfhXLmum4gYRERERERERERERERERERERERERERGFun8AWd0H/Y0/VmYAAAAASUVORK5CYII=";
        
        UIImage* image = [self decodeBase64ToImage:rotateImageData];
        
        [_rotateButton setImage:image forState:UIControlStateNormal];
        
//        NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"editimages" ofType:@"bundle"]];
//        if (bundle != nil) {
//            NSString *imagePath = [bundle pathForResource:@"ic_rotate_90_degrees_ccw" ofType:@"png"];
//            UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
//            [_rotateButton setImage:image forState:UIControlStateNormal];
//        }
        
//        [_rotateButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ic_rotate_90_degrees_ccw" ofType:@"png"]] forState:UIControlStateNormal];
        _rotateButton.tag = 0;
        _rotateButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_rotateButton.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@25);
            make.center.equalTo(@0);
        }];
        [_rotateButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rotateButton;
}

- (UIButton *)cancelButton {
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc] init];
        
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _cancelButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _cancelButton.tag = 1;
        [_cancelButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

- (UIButton *)originButton {
    if (!_originButton) {
        _originButton = [[UIButton alloc] init];
        
        [_originButton setTitle:@"还原" forState:UIControlStateNormal];
        [_originButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _originButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _originButton.tag = 2;
        [_originButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _originButton;
}

- (UIButton *)finishButton {
    if (!_finishButton) {
        _finishButton = [[UIButton alloc] init];
        
        [_finishButton setTitle:@"完成" forState:UIControlStateNormal];
        [_finishButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _finishButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
        _finishButton.tag = 3;
        [_finishButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _finishButton;
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor colorWithWhite:1 alpha:.3f];
    }
    return _line;
}

- (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData {
    NSURL *url = [NSURL URLWithString:strEncodeData];
    NSData *data = [NSData dataWithContentsOfURL:url];
    return [UIImage imageWithData:data];
}

@end
