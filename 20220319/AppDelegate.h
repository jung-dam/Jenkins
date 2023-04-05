//
//  AppDelegate.h
//  20220319
//
//  Created by jdchae on 2022. 3. 19..
//  Copyright (c) 2022년 jdchae. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "model.h"

//View와 Model 연결 역할 - Presenter
@interface PresenterNum : NSObject
{
    int m_NumA;
    int m_NumB;
    int m_SumResult;
    int m_MulResult;
    
    NSString *m_Num;

}
- (void) GetRandomNum;
- (void) GetSumResult;
- (void) GetMulResult;
- (id)initView:(id)_app;

- (void) SetNum:(NSString*)_Num;
- (void) SetCal:(enum CALRESULT)_Cal;

@end

//View
@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (weak) IBOutlet NSButton *RandomButton;
@property (weak) IBOutlet NSButton *SumButton;
@property (weak) IBOutlet NSButton *MulButton;

//
@property (weak) IBOutlet NSTextField *ResultNum;
@property (weak) IBOutlet NSButton *Button0;
@property (weak) IBOutlet NSButton *Button1;
@property (weak) IBOutlet NSButton *Button2;
@property (weak) IBOutlet NSButton *Button3;
@property (weak) IBOutlet NSButton *Button4;
@property (weak) IBOutlet NSButton *Button5;
@property (weak) IBOutlet NSButton *Button6;
@property (weak) IBOutlet NSButton *Button7;
@property (weak) IBOutlet NSButton *Button8;
@property (weak) IBOutlet NSButton *Button9;
@property (weak) IBOutlet NSButton *ButtonSUM;
@property (weak) IBOutlet NSButton *ButtonSUB;
@property (weak) IBOutlet NSButton *ButtonMUL;
@property (weak) IBOutlet NSButton *ButtonDIV;
-(IBAction)Button0_click:(id)sender;
-(IBAction)Button1_click:(id)sender;
-(IBAction)Button2_click:(id)sender;
-(IBAction)Button3_click:(id)sender;
-(IBAction)Button4_click:(id)sender;

-(IBAction)ButtonSUM_click:(id)sender;
-(IBAction)ButtonSUB_click:(id)sender;
-(IBAction)ButtonMUL_click:(id)sender;
-(IBAction)ButtonDIV_click:(id)sender;

-(void)UpdateResultNum:(NSString*)_Num;
//

@property (weak) IBOutlet NSTextField *NSNumA;
@property (weak) IBOutlet NSTextField *NSNumB;
@property (weak) IBOutlet NSTextField *SumResult;
@property (weak) IBOutlet NSTextField *MulResult;

-(IBAction)Randombutton_click:(id)sender;
-(IBAction)Sumbutton_click:(id)sender;
-(IBAction)Mulbutton_click:(id)sender;

-(void)UpdateRandomNum:(int)_NumA:(int)_NumB;
-(void)UpdateSumResult:(int)_SumResultNum;
-(void)UpdateMulResult:(int)_MulResultNum;

-(id)init;

@end














//@protocol Num <NSObject>
//
//@required
//- (void) Set:(NSString);
//@optional
//- (void) SetNum:(NSString);
//
//@end


