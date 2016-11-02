//
//  CYBUpdateVersionView.m
//  myApp
//
//  Created by 123 on 16/10/17.
//  Copyright © 2016年 careerman. All rights reserved.
//

#import "MCUpdateVersionView.h"

#import "Masonry.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kLeftRightMargin 30
#define kContenyFont [UIFont systemFontOfSize:16.0]


@interface MCUpdateVersionView ()

@property(nonatomic,strong)UIView * subView;
@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation MCUpdateVersionView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)show{
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [self setupUI];
}

-(void)setupUI{
    
    
    self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);

    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    /// 背景图
    _subView = [[UIView alloc] init];
    _subView.layer.cornerRadius = 5;
    _subView.backgroundColor  = [UIColor whiteColor];
    [self addSubview:_subView];
    /// 标题(新版本更新)
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"新版本更新";
    nameLabel.font = [UIFont boldSystemFontOfSize:18.0];
    [_subView addSubview:nameLabel];
    /// 版本号
    UILabel *versonLabel = [[UILabel alloc] init];
    versonLabel.text = self.versions;
    versonLabel.font = [UIFont systemFontOfSize:15.0];
    versonLabel.textColor = [UIColor orangeColor];
    [_subView addSubview:versonLabel];
    /// 上面的线
    UIView *upLine = [[UIView alloc] init];
    upLine.backgroundColor = [UIColor grayColor];
    [_subView addSubview:upLine];
    
    _scrollView = [[UIScrollView alloc] init];
    
    CGSize labelSize = [self calculateSizeWithText:self.content limitWidth:kScreenWidth -kLeftRightMargin * 2 - 30 font:kContenyFont lineSpacing:5 lineHeightMultiple:0 lineBreakMode:NSLineBreakByWordWrapping];
    _scrollView.contentSize = CGSizeMake(0, labelSize.height+50);
    [_subView addSubview:_scrollView];
//    _scrollView.frame = CGRectMake(0, 0, 200, 200);
    /// 内容
    UILabel *contentLabel = [[UILabel alloc] init];
//    contentLabel.text = self.content;
    contentLabel.attributedText = [self getAttributedStringWithString:self.content font:kContenyFont lineSpacing:5 lineHeightMultiple:0 lineBreakMode:NSLineBreakByWordWrapping];
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = NSTextAlignmentLeft;
    [_scrollView addSubview:contentLabel];
    
    /// 底部的线
    UIView *downLine = [[UIView alloc] init];
    downLine.backgroundColor =  [UIColor grayColor];
    [_subView addSubview:downLine];
    /// 更新按钮
    UIButton *updateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    updateButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [updateButton setTitle:@"去App Store更新" forState:UIControlStateNormal];
    [updateButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [_subView addSubview:updateButton];
    [updateButton addTarget:self action:@selector(updateButtonClick) forControlEvents:UIControlEventTouchUpInside];
    // 取消按钮
    UIButton *cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    cancleButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [_subView addSubview:cancleButton];
    [cancleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancleButton addTarget:self action:@selector(cancleButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *midLine = [[UIView alloc] init];
    midLine.backgroundColor =  [UIColor grayColor];
    [_subView addSubview:midLine];
    
    [_subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kLeftRightMargin);
        make.center.equalTo(self);
        make.height.equalTo(@(314));
    }];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_subView);
        make.left.equalTo(_subView).offset(15);
        make.height.equalTo(@(44));
    }];
    
    [versonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_subView).offset(-15);
        make.top.equalTo(_subView);
        make.height.equalTo(nameLabel);
    }];
    
    [upLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_subView);
        make.top.equalTo(nameLabel.mas_bottom);
        make.height.equalTo(@(1));
    }];
    if (self.updataType == MCChooseUpdate) {
    
        [cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_subView);
            make.bottom.equalTo(_subView);
            make.height.equalTo(@(44));
            make.right.equalTo(updateButton.mas_left);
        }];
        [midLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cancleButton.mas_right);
            make.top.equalTo(cancleButton);
            make.bottom.equalTo(cancleButton);
            make.width.equalTo(@(1));
        }];
        
        [updateButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_subView);
            make.height.equalTo(@(44));
            make.right.equalTo(_subView);
            make.width.equalTo(cancleButton);
        }];
    }else{
        nameLabel.text = @"强制更新";
        [updateButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_subView);
            make.height.equalTo(@(44));
            make.left.right.equalTo(_subView);
        }];
    }

    
    [downLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_subView);
        make.bottom.equalTo(updateButton.mas_top);
        make.height.equalTo(@(1));
    }];
    
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_subView).offset(0);
        make.right.equalTo(_subView).offset(0);
        make.top.equalTo(upLine).offset(0);
        make.bottom.equalTo(downLine).offset(0);
    }];
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_scrollView).offset(15);
        make.left.equalTo(_scrollView).offset(15);
        make.width.equalTo(@(kScreenWidth -kLeftRightMargin * 2 - 30));
    }];
}

-(void)updateButtonClick{
    
    if (self.updataType == MCChooseUpdate) {
        [self cancleButtonClick];
    }
    NSURL *url = [NSURL URLWithString:@"你应用在APP store上面的地址"];
    [[UIApplication sharedApplication] openURL:url];
}
-(void)cancleButtonClick{
    
    
     [self removeFromSuperview];
}
- (NSMutableAttributedString *)getAttributedStringWithString:(NSString *)string font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing lineHeightMultiple:(CGFloat)lineHeightMultiple lineBreakMode:(NSLineBreakMode )lineBreakMode{
    if (string == nil) {
        return nil;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    paragraphStyle.lineHeightMultiple = lineHeightMultiple;
    paragraphStyle.lineBreakMode = lineBreakMode;
    NSDictionary *cyZoneDocAttribute = @{NSFontAttributeName:font,NSParagraphStyleAttributeName: paragraphStyle};
    
    [attributedString addAttributes:cyZoneDocAttribute range:NSMakeRange(0, [string length])];
    return attributedString;
}
- (CGSize)calculateSizeWithText:(NSString *)text limitWidth:(CGFloat)limitW font:(UIFont *)font lineSpacing:(CGFloat)lineSpacing lineHeightMultiple:(CGFloat)lineHeightMultiple lineBreakMode:(NSLineBreakMode )lineBreakMode{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    paragraphStyle.lineHeightMultiple = lineHeightMultiple;
    paragraphStyle.lineBreakMode = lineBreakMode;
    NSDictionary *cyZoneDocAttribute = @{NSFontAttributeName:font,NSParagraphStyleAttributeName: paragraphStyle};
    
    CGSize size;
    size = [text boundingRectWithSize:CGSizeMake(limitW, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:cyZoneDocAttribute context:nil].size;
    return size;
}
@end
