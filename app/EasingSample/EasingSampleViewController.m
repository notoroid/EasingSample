//
//  EasingSampleViewController.m
//  EasingSample
//
//  Created by Irimasu Densan Planning on 11/05/27.
//  Copyright 2011 いります電算企画. All rights reserved.
//

#import "EasingSampleViewController.h"

@implementation EasingSampleViewController

@synthesize placeHolderView=_placeHolderView,placeHolder2View=_placeHolder2View;
@synthesize easingSegment=_easingSegment;
@synthesize customEasingDataPickerView=_customEasingDataPickerView;
@synthesize opacitySwitch=_opacitySwitch;
@synthesize easingNames=easingNames_;
@synthesize currentCustomEasing=currentCustomEasing_;
@synthesize currentEasing=currentEasing_;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGFloat scale = [[UIScreen mainScreen] respondsToSelector:NSSelectorFromString(@"scale")] ? [UIScreen mainScreen].scale : 1.0f;
    // スケールを判別
    
    // CoreAnimation が用意したイージイング動作確認用layer を作成する
    packageLayer_ = [[CALayer alloc] init];
    packageLayer_.bounds = CGRectMake(0.0f,0.0f,_placeHolderView.frame.size.width,_placeHolderView.frame.size.height);
    packageLayer_.position = CGPointMake(_placeHolderView.frame.size.width * .5f,_placeHolderView.frame.size.height * .5f);
    
	NSString* packageImageName = ( scale > 1.0f ) ? @"Package@2x.png" : @"Package.png"; // 画像解像度によって読み込む画像切り分け
	NSString* packageSourcePath = [[NSBundle mainBundle] pathForResource:[packageImageName stringByDeletingPathExtension] ofType:[packageImageName pathExtension] ];
    // 絶対パスを取得する
	NSData* packageData = [[NSData alloc] initWithContentsOfFile:packageSourcePath];
        // データを取得する
	UIImage* packageImage = [[UIImage alloc] initWithData:packageData];
        // イメージを取得する
    packageLayer_.contents = (id)[packageImage CGImage];
    [_placeHolderView.layer addSublayer:packageLayer_];
    
    [packageImage release];
    [packageData release];
    
    // カスタムしたイージイング動作確認用layer を作成する
    package2Layer_ = [[CALayer alloc] init];
    package2Layer_.bounds = CGRectMake(0.0f,0.0f,_placeHolder2View.frame.size.width,_placeHolder2View.frame.size.height);
    package2Layer_.position = CGPointMake(_placeHolder2View.frame.size.width * .5f,_placeHolder2View.frame.size.height * .5f);
    
	packageImageName = ( scale > 1.0f ) ? @"Package2@2x.png" : @"Package2.png"; // 画像解像度によって読み込む画像切り分け
	packageSourcePath = [[NSBundle mainBundle] pathForResource:[packageImageName stringByDeletingPathExtension] ofType:[packageImageName pathExtension] ];
    // 絶対パスを取得する
	packageData = [[NSData alloc] initWithContentsOfFile:packageSourcePath];
    // データを取得する
	packageImage = [[UIImage alloc] initWithData:packageData];
    // イメージを取得する
    package2Layer_.contents = (id)[packageImage CGImage];
    [_placeHolder2View.layer addSublayer:package2Layer_];
    
    [packageImage release];
    [packageData release];
    
    // イージング種類を得る
    self.easingNames = [NSArray arrayWithObjects:kEaseinexpo,kEaseoutexpo,kEaseinback,kEaseoutback,kEaseinoutback, nil];
    self.currentCustomEasing = [self.easingNames objectAtIndex:0];
    
    self.currentEasing = kCAMediaTimingFunctionEaseIn;
    self.easingSegment.selectedSegmentIndex = 0;
    
    [self firedStart:self];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Actions

#define SLIDE_IN_LENGTH 180.0f
- (IBAction) firedStart:(id)sender
{
    [CATransaction begin];
 
    // 通常のアクションイージングアクションを作成
    [packageLayer_ removeAllAnimations];
    // アニメーションを登録
    CABasicAnimation* slideinAnimation = [[CABasicAnimation alloc] init]; // インスタンスを作成する
    slideinAnimation.keyPath = @"position.x"; // 座標を移動する
    slideinAnimation.fromValue = [NSNumber numberWithFloat:packageLayer_.position.x + SLIDE_IN_LENGTH]; // 下から上へ移動
    slideinAnimation.toValue = [NSNumber numberWithFloat:packageLayer_.position.x]; // CALayer の位置に移動
    slideinAnimation.duration = 1.5f; // アニメーション時間 [秒].[ミリ秒]
    slideinAnimation.repeatCount = 1.0f; // 繰り返し回数
    
    // タイミングファンクションを設定
    slideinAnimation.timingFunction = [CAMediaTimingFunction functionWithName:self.currentEasing];
        // CAMediaTimingFunction.h に記述されているeasing 種別のみ
    
    [packageLayer_ addAnimation:slideinAnimation forKey:@"slideinPackageAnimation"];
        // キー名slideinPackageAnimation として追加
    
    // アニメーション終了後のレイヤーへの値値反映はこのタイミングで記述
    [slideinAnimation release];

    [package2Layer_ removeAllAnimations];
    // アニメーションを登録
    easeblock_t easyease = [[Equations defaultEquations] easyeaseByKey:self.currentCustomEasing];
        // Equations よりブロック構文を得る
    
    // CAMediaTimingFunction以外のイージングを利用する。CAMediaTimingFunction と異なるのは
    // コマ数の精度を秒当りのステップ数で計算すること、CGFloat型で引数を渡す点
    EasyEaseAnimation* easyingAnimation = [[EasyEaseAnimation alloc]
                                             initWithKeyPath:@"position.x"
                                             startValue:packageLayer_.position.x + SLIDE_IN_LENGTH
                                             endValue:packageLayer_.position.x
                                             block:easyease
                                             params:nil
                                             interstitialSteps:24.0f
                                             beginSteps:0.0f];
    
    easyingAnimation.duration = 1.5f; // アニメーション時間 [秒].[ミリ秒]
    easyingAnimation.repeatCount = 1.0f; // 繰り返し回数

    [package2Layer_ addAnimation:easyingAnimation forKey:@"easyeasePackageAnimation"];
    // キー名easyeasePackageAnimation として追加
    
    // アニメーション終了後のレイヤーへの値値反映はこのタイミングで記述
    [easyingAnimation release];
    
    [CATransaction commit];
        // beginメソッドが呼び出された後の全てのアニメーションを一括設定
}

- (IBAction) firedEasing:(id)sender
{
    // 選択されたカスタムイージング向けイージング名を記憶しておく
    switch (self.easingSegment.selectedSegmentIndex) {
        case 0:
            self.currentEasing = kCAMediaTimingFunctionLinear;
            break;
        case 1:
            self.currentEasing = kCAMediaTimingFunctionEaseIn;
            break;
        case 2:
            self.currentEasing = kCAMediaTimingFunctionEaseOut;
            break;
        case 3:
            self.currentEasing = kCAMediaTimingFunctionEaseInEaseOut;
            break;
        default:
            break;
    }
    [self firedStart:self];
}

- (IBAction) firedOpacity:(id)sender
{
    // 比較用のレイヤーの透過率を1.0/0.5を切り替える。暗黙のアニメーションを使用
    packageLayer_.opacity = package2Layer_.opacity = ((UISwitch*)sender).on ? 1.0f : 0.5f;
}

- (IBAction) firedEagigLayerHidden:(id)sender
{
    // 比較用のレイヤーを表示/非表示を切り替える。暗黙のアニメーションを使用
    packageLayer_.hidden = ((UISwitch*)sender).on ? NO : YES; // 
}

- (IBAction) firedCustomEasingLayerHidden:(id)sender
{
    // 比較用のレイヤーを表示/非表示を切り替える。暗黙のアニメーションを使用
    package2Layer_.hidden = ((UISwitch*)sender).on ? NO : YES; // カスタムイージイング用layer を表示/非表示とする
}

#pragma mark - 
#pragma mark UIPickerView delegate methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [easingNames_ count]; // イージー名の数を返す
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [easingNames_ objectAtIndex:row];
    [self firedStart:self];
    // 即反映する
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // 選択されたイージング名を保存する
    self.currentCustomEasing = [easingNames_ objectAtIndex:row];
    [self firedStart:self];
        // 即反映する
}


- (void)viewDidUnload
{
    // インスタンスを解放する
    [packageLayer_ removeFromSuperlayer];
    packageLayer_ = nil;
    [packageLayer_ release];

    [package2Layer_ removeFromSuperlayer];
    package2Layer_ = nil;
    [package2Layer_ release];
    
    self.currentCustomEasing = nil;
    self.easingNames = nil;
    self.placeHolderView = nil;
    self.placeHolder2View = nil;
    self.easingSegment = nil;
    self.customEasingDataPickerView = nil;
    self.opacitySwitch  =nil;

    [super viewDidUnload];
}

- (void)dealloc
{
    // インスタンスを解放する
    [packageLayer_ release];
    [package2Layer_ release];
    [currentCustomEasing_ release];
    [easingNames_ release];
    [_opacitySwitch release];
    [_placeHolder2View release];
    [_placeHolderView release];
    [_easingSegment release];
    [_customEasingDataPickerView release];
    
    [super dealloc];
}


@end
