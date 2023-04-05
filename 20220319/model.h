//
//  model.h
//  20220319
//
//  Created by jdchae on 2022. 4. 8..
//  Copyright (c) 2022년 jdchae. All rights reserved.
//

#ifndef _0220319_model_h
#define _0220319_model_h

#endif

enum CALRESULT{
    SUM,
    MUL,
    SUB,
    DIV,
    
};
typedef void (^responseBlock2)(NSString *_Num, enum CALRESULT _EResult );
//Number 데이터 모델 - Model
@interface NumberModel : NSObject
{
    int m_NumA;
    int m_NumB;
    int m_SumResult;
    int m_MulResult;
    NSString *m_Num;
    void (^responseBlock)(NSString *_Num, enum CALRESULT _EResult );
}
- (int) GetRanNumA;
- (int) GetRanNumB;
- (int) GetSumNum;
- (int) GetMulNum;

- (int) SetNum:(NSString*)m_Num;

//- (void)SetCompletionHanler:(void (^responseBlock)(double, CALRESULT))completionBlock; 왜 안 돼?

- (void)SetCompletionHanler2:(responseBlock2)completionBlock;
- (void)SetCompletionHanler:(void (^)(NSString *_Num, enum CALRESULT _ECalResult))completionBlock;
//- (void)SetCompletionHanler:(BOOL^(double num, enum CALRESULT))completionBlock;
//- (void)SetCompletionHanler:(double)_Num: (enum)CALRESULT;

@end

