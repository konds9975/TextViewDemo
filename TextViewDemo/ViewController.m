//
//  ViewController.m
//  TextViewDemo
//
//  Created by Kondya on 07/12/17.
//  Copyright © 2017 Kondya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>
{
    UIImageView *imgView;
}
@property (weak, nonatomic) IBOutlet UITextView *textview;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.textview.delegate = self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addImage:(id)sender {
    
    self.textview.text = @"test text";
    
   imgView = [[UIImageView alloc] init];
    
    imgView.image = [UIImage imageNamed:@"smily.jpg"];
    imgView.layer.cornerRadius = 10;
   
    
}
-(void)textViewDidChange:(UITextView *)textView
{
    CGPoint cursorPosition = [self.textview caretRectForPosition:self.textview.selectedTextRange.start].origin;
    [imgView setFrame:CGRectMake(0, cursorPosition.y+50, self.textview.frame.size.width, 300)];
     [self.textview addSubview:imgView];
    
    CGFloat fixedWidth = textView.frame.size.width;
    CGSize newSize = [textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = textView.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height+300);
    [textView setContentSize:CGSizeMake(newFrame.size.width, newFrame.size.height)];
    
    
    
}

@end
