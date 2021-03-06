//
//  BMCommonRequest.m
//  WeexDemo
//
//  Created by XHY on 2017/1/13.
//  Copyright © 2017年 taobao. All rights reserved.
//

#import "BMCommonRequest.h"
#import "BMAxiosRequestModel.h"
#import "BMUserInfoModel.h"

@implementation BMCommonRequest
{
    BMAxiosRequestModel *_model;
}

- (YTKRequestMethod)requestMethod
{
    if (!_model.method || [_model.method isEqualToString:@"GET"]) {
        return YTKRequestMethodGET;
    }
    return YTKRequestMethodPOST;
}

- (NSString *)requestURLPath
{
    return [NSURL URLWithString:_model.url].path;
}

- (NSString *)baseUrl
{
    return @"";
}

/** 添加自定义 Headers */
- (NSDictionary *)requestHeaderFieldValueDictionary
{
    /** headers */
    NSMutableDictionary *headers = [NSMutableDictionary dictionary];
    if (_model.header) {
        [headers setValuesForKeysWithDictionary:_model.header];
    }
    
    return headers;
}

- (NSString *)requestUrl
{
    return _model.url ?: @"";
}

- (instancetype)initWithRequestModel:(BMAxiosRequestModel *)model
{
    if (self = [super init]) {
        _model = model;
    }
    return self;
}

- (id)requestArgument
{
    return _model.data;
}

@end
