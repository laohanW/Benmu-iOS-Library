//
//  BMUploadImageModel.h
//  BM-JYT
//
//  Created by XHY on 2017/3/8.
//  Copyright © 2017年 XHY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BMUploadImageModel : NSObject

@property (nonatomic, assign) NSInteger maxCount;   // 一次最多可选择图片数量
@property (nonatomic, assign) CGFloat imageWidth;   // 图片宽度（根据宽度按比例裁剪）
@property (nonatomic, assign) BOOL allowCrop;       // 是否允许编辑（只有当 maxCount == 1时 此参数才会生效）

@end
