//
//  model.m
//  20220319
//
//  Created by jdchae on 2022. 4. 8..
//  Copyright (c) 2022년 jdchae. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "model.h"

//숫자 데이터 처리 역할을 하는 Model 구현부
@implementation NumberModel
- (int) GetRanNumA
{
    m_NumA = arc4random_uniform(100);
    NSLog(@"NumA = %d", m_NumA);
    return m_NumA;
}
- (int) GetRanNumB
{
    m_NumB = arc4random_uniform(100);
    return m_NumB;
}
- (int) GetSumNum//:(int)_NumA:(int)_NumB
{
    m_SumResult = m_NumA + m_NumB;
    return m_SumResult;
}
- (int) GetMulNum//:(int)NumA:(int)NumB
{
    m_MulResult = m_NumA * m_NumB;
    return m_MulResult;
}

- (int) SetNum:(NSString*)_Num
{
    if (m_Num == nil)
    {
        m_Num = @"0";
    }
    //NSLog(@"_Num = %@", _Num);
    m_Num = [m_Num stringByAppendingString:_Num];
    //NSLog(@"m_Num = %@", m_Num);
    m_NumA = [m_Num intValue];
    return m_NumA;
}
- (void)SetCompletionHanler:(void (^)(NSString *_Num, enum CALRESULT _EResult))completionBlock
{
    //enum CALRESULT ee = _EResult;
    responseBlock = completionBlock;
   // [self SetCompletionHanler:completionBlock^{}];
     NSLog(@"SetCompletionHanler in ");
    enum CALRESULT er = SUM;
    if (m_Num == nil)
    {
        m_Num = @"0";
    }
   // NSLog(@"_Num = %@", _Num);
   // m_Num = [m_Num stringByAppendingString:_Num];
    NSLog(@"m_Num = %@", m_Num);
    m_NumA = [m_Num intValue];
    
    
    
    completionBlock(m_Num,er);
    
    
    
}
@end
// - [ 문자열 형변환 ]

//[mStr intValue];        // -> int 형
//
//[mStr floatValue];     // -> float 형
//
//[mStr doubleValue];    // -> double 형
