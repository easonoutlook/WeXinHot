//
//  TTFeedbackViewController.m
//  QVOD
//
//  Created by Eason on 10/03/2015.
//  Copyright (c) 2015 www.xyzs.com. All rights reserved.
//

#import "TTFeedbackViewController.h"


@interface TTFeedbackViewController ()<UITextViewDelegate, UMFeedbackDataDelegate>

@property (nonatomic, strong) UITextField *contactTextField;

@property (nonatomic, strong) UITextView *contentTextView;

@property (nonatomic, strong) UILabel *placeholderLabel;

@property (nonatomic, strong) UIButton *sendButton;

@property (strong, nonatomic) UMFeedback* feedback;

@end

@implementation TTFeedbackViewController
@synthesize placeholderLabel = _placeholderLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"反馈";

    self.feedback = [UMFeedback sharedInstance];
    self.feedback.delegate = self;

    [self.feedback stopRecordAndPlayback];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStyleDone target:self action:@selector(sendButtonClicked:)];

    [self.view addSubview:[self contactTextField]];

    [self.view addSubview:[self contentTextView]];

    [self.contentTextView addSubview:[self placeholderLabel]];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.contentTextView resignFirstResponder];
    [self.contactTextField resignFirstResponder];
}

- (UITextField *)contactTextField
{
    if (!_contactTextField) {
        CGRect frame = CGRectMake(self.view.frame.origin.x + 10.f, self.view.frame.origin.y + 280.f, self.view.frame.size.width - 20.f, 26.f);
        _contactTextField = [[UITextField alloc] initWithFrame:frame];
        _contactTextField.placeholder = @"QQ/邮箱/手机";
        _contactTextField.layer.borderColor = TTRGBColor(61, 114, 251).CGColor;
        _contactTextField.layer.borderWidth = 0.5f;
        _contactTextField.layer.cornerRadius = 5.f;
        _contactTextField.font = TTSystemFont(15);
        _contactTextField.textColor = TTGrayColor;
    }

    return _contactTextField;
}

- (UITextView *)contentTextView
{
    if (!_contentTextView) {
        CGRect frame = CGRectMake(self.view.frame.origin.x + 10.f, self.view.frame.origin.y + 90.f, self.view.frame.size.width - 20.f, 170.f);
        _contentTextView = [[UITextView alloc] initWithFrame:frame];
        _contentTextView.layer.borderWidth = 0.5f;
        _contentTextView.layer.borderColor = TTRGBColor(61, 114, 251).CGColor;
        _contentTextView.layer.cornerRadius = 5.f;
        _contentTextView.delegate = self;
        _contentTextView.font = TTSystemFont(15);
        _contentTextView.textColor = TTGrayColor;
    }

    return _contentTextView;
}

- (UILabel *)placeholderLabel
{
    if (!_placeholderLabel) {
        CGRect frame = CGRectMake(3.f, 3.f, 300.f, 20.f);
        _placeholderLabel = [[UILabel alloc] initWithFrame:frame];
        _placeholderLabel.text = @"请输入要反馈(kan)的内(pian)容(zi)";
        _placeholderLabel.textColor = TTLightGrayColor;
        _placeholderLabel.font = TTSystemFont(15);

    }
    return _placeholderLabel;
}

#pragma UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView
{
    TTDEBUGLOG(@"text view change");
    [_placeholderLabel removeFromSuperview];
}

- (void)sendButtonClicked:(UIButton *)btn
{
    TTDEBUGLOG(@"send btn clicked.");

    if (_contentTextView.text.length > 0 || _contactTextField.text.length > 0) {
        NSString *total = [NSString stringWithFormat:@"content: %@----contact: %@", _contentTextView.text, _contactTextField.text];
        NSDictionary* postContent = @{
                                      @"content" : total
                                      };
        [[UMFeedback sharedInstance] post:postContent];
    }else{
        TTDEBUGLOG(@"请填写内容");
    }
}

- (void)postFinishedWithError:(NSError*)error
{
    if (error != nil) {
        TTDEBUGLOG(@"post error%@", error);
    }
    else {
        TTDEBUGLOG(@"post succ%@", self.feedback.topicAndReplies);
        [self.navigationController popViewControllerAnimated:YES];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
