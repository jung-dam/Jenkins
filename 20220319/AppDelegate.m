//
//  AppDelegate.m
//  20220319
//
//  Created by jdchae on 2022. 3. 19..
//  Copyright (c) 2022년 jdchae. All rights reserved.
//
#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@property NSViewController *viewController;

@end


//Model에서 처리한 데이터를 View로 전달하는 역할을 하는 Presentor 구현부
@implementation PresenterNum

NumberModel *RanNum;
AppDelegate *view;

-(id)initView:(id)_app
{
    self = [super init]; //생성자
    view = _app;
    RanNum = [[NumberModel alloc] init];
    return self;
}

- (void) GetRandomNum
{
    m_NumA = [RanNum GetRanNumA];
    m_NumB = [RanNum GetRanNumB];
    NSLog(@"PresenterNumA = %d\n", m_NumA);
    NSLog(@"PresenterNumB = %d\n", m_NumB);
    [view UpdateRandomNum:m_NumA:m_NumB];
}
- (void) GetSumResult
{
    m_SumResult = [RanNum GetSumNum];//모델에 데이터 요청하고
    [view UpdateSumResult:m_SumResult];//뷰에 전달하는 부분 분리하기
}
- (void) GetMulResult
{
    m_MulResult = [RanNum GetMulNum];
    [view UpdateMulResult:m_MulResult];
}

- (void) SetNum:(NSString*)_Num
{
    [RanNum SetNum:_Num];
//    [RanNum SetNum:_Num];
//    m_Num = _Num;
//    [view UpdateResultNum:m_Num];
//    enum CALRESULT er = SUM;
    [RanNum SetCompletionHanler:^(NSString *_Num, enum CALRESULT m_Result)
     {
         switch (m_Result) {
             case SUM:
                 NSLog(@"SUM1\n");
                 break;
             case SUB:
                 NSLog(@"SUB\n");
                 break;
             case MUL:
                 NSLog(@"MUL\n");
                 break;
             case DIV:
                 NSLog(@"DIV\n");
                 break;
                 
             default:
                 break;
         }
     }];
}

- (void) SetCal:(enum CALRESULT)_Cal
{
    //completionBlock(m_Num,_Cal);
    [RanNum SetCompletionHanler:^(NSString *_Num, enum CALRESULT _Cal)
     {
         switch (_Cal) {
             case SUM:
                 //completionBlock(RanNum->m_NumA,_Cal);
                 NSLog(@"SUM2\n");
                 break;
             case SUB:
                 NSLog(@"SUB\n");
                 break;
             case MUL:
                 NSLog(@"MUL\n");
                 break;
             case DIV:
                 NSLog(@"DIV\n");
                 break;
                 
             default:
                 break;
         }
     }];

}

@end


@implementation AppDelegate

PresenterNum *Presenter;

-(IBAction)Button0_click:(id)sender{
//    NSButton.sender.sender
//    Button0.current
    [Presenter SetNum:@"0"];
}
-(IBAction)Button1_click:(id)sender{
    [Presenter SetNum:@"1"];
}
-(IBAction)Button2_click:(id)sender{
    [Presenter SetNum:@"2"];
}
-(IBAction)Button3_click:(id)sender{
    [Presenter SetNum:@"3"];
}
-(IBAction)Button4_click:(id)sender{
    [Presenter SetNum:@"4"];
}

-(IBAction)ButtonSUM_click:(id)sender{
    [Presenter SetCal:SUM];
}
-(IBAction)ButtonSUB_click:(id)sender{
    [Presenter SetCal:SUB];
}


-(void)UpdateResultNum:(NSString*)_Num{
    self.ResultNum.stringValue = _Num;
}
///////////////////////////////////////////
-(IBAction)Randombutton_click:(id)sender{
    
    [Presenter GetRandomNum];
}
-(IBAction)Sumbutton_click:(id)sender{
    
    [Presenter GetSumResult];
    
}
-(IBAction)Mulbutton_click:(id)sender{
    
    [Presenter GetMulResult];
}
-(void)UpdateRandomNum:(int)_NumA:(int)_NumB
{
    NSString *ssNumA = [NSString stringWithFormat:@"%d", _NumA]; //view에서 타입캐스팅 하지 말기 모델에서 하기
    NSString *ssNumB = [NSString stringWithFormat:@"%d", _NumB];

    self.NSNumA.stringValue = ssNumA;
    self.NSNumB.stringValue = ssNumB;
}
-(void)UpdateSumResult:(int)_SumResultNum
{
    NSString *ssSumResultNum = [NSString stringWithFormat:@"%d", _SumResultNum];
    
    self.SumResult.stringValue = ssSumResultNum;

}
-(void)UpdateMulResult:(int)_MulResultNum
{
    NSString *ssMulResultNum = [NSString stringWithFormat:@"%d", _MulResultNum];
    
    self.MulResult.stringValue = ssMulResultNum;
}

-(id)init
{
    self = [super init];
    Presenter = [[PresenterNum alloc] initView:self];//프레젠터의 생성자 매개변수로 나를 넣어 줌
    return self;
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    int num = 300000;
    int inputnum = 0;
    NSString *numberString = [NSNumberFormatter localizedStringFromNumber:@(num) numberStyle:NSNumberFormatterDecimalStyle];
    printf("%s\n", [numberString cStringUsingEncoding:NSUTF8StringEncoding]);
    //scanf("%d", &inputnum);
    printf("%d\n", inputnum);
    //NSLog(@"%@\n", numberString);
}
- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end




