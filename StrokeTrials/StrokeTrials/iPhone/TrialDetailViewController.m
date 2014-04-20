//
//  TrialDetailViewController.m
//  StrokeTrials
//
//  Created by The Mullets on 2/28/14.
//  Copyright (c) 2014 The Mullets. All rights reserved.
//

#import "TrialDetailViewController.h"

@interface TrialDetailViewController () <MFMailComposeViewControllerDelegate>

@end

@implementation TrialDetailViewController
{
    bool specLastChar;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.topItem.title = @"Back";
    self.title = self.trial.acro;
    self.titleLabel.text = [self.trial.title uppercaseString];
    self.yearLabel.text = self.trial.year;
    self.blLabel.text = self.trial.bl;
    
    NSMutableString *resText = [NSMutableString string];
    for (NSString* result in self.trial.res) {
        if(specLastChar) {
            specLastChar = false;
            [resText appendFormat:@"%@\n", result];
        }
        else {
            if(![result  isEqual: @"\n"]) {
                if([result  isEqual: @"<"]) {
                    [resText length] < 1 ?[resText appendString: @"- "]:[resText deleteCharactersInRange:NSMakeRange([resText length]-1, 1)];
                    [resText appendString: @"<"];
                    specLastChar = true;
                }
                else if([result  isEqual: @">"]) {
                    [resText length] < 1 ?[resText appendString: @"- "]:[resText deleteCharactersInRange:NSMakeRange([resText length]-1, 1)];
                    [resText appendString: @">"];
                    specLastChar = true;
                }
                else if([result  isEqual: @"&"]) {
                    [resText length] < 1 ?[resText appendString: @"- "]:[resText deleteCharactersInRange:NSMakeRange([resText length]-1, 1)];
                    [resText appendString: @"&"];
                    specLastChar = true;
                }
                else if([result  isEqual: @"'"]) {
                    [resText length] < 1 ?[resText appendString: @"- "]:[resText deleteCharactersInRange:NSMakeRange([resText length]-1, 1)];
                    [resText appendString: @"'"];
                    specLastChar = true;
                }
                else if([result  isEqual: @"\""]) {
                    [resText length] < 1 ?[resText appendString: @"- "]:[resText deleteCharactersInRange:NSMakeRange([resText length]-1, 1)];
                    [resText appendString: @"\""];
                    specLastChar = true;
                }
                else {
                    [resText appendFormat:@"- %@\n", result];
                }
            }
        }
    }
    self.resLabel.text = resText;
    
    NSMutableString *limText = [NSMutableString string];
    for (NSString* limitation in self.trial.lim) {
        if(specLastChar) {
            specLastChar = false;
            [limText appendFormat:@"%@\n", limitation];
        }
        else {
            if(![limitation  isEqual: @"\n"]) {
                if([limitation  isEqual: @"<"]) {
                    [limText length] < 1 ?[limText appendString: @"- "]:[limText deleteCharactersInRange:NSMakeRange([limText length]-1, 1)];
                    [limText appendString: @"<"];
                    specLastChar = true;
                }
                else if([limitation isEqual: @">"]) {
                    [limText length] < 1 ?[limText appendString: @"- "]:[limText deleteCharactersInRange:NSMakeRange([limText length]-1, 1)];
                    [limText appendString: @">"];
                    specLastChar = true;
                }
                else if([limitation isEqual: @"&"]) {
                    [limText length] < 1 ?[limText appendString: @"- "]:[limText deleteCharactersInRange:NSMakeRange([limText length]-1, 1)];
                    [limText appendString: @"&"];
                    specLastChar = true;
                }
                else if([limitation isEqual: @"'"]) {
                    [limText length] < 1 ?[limText appendString: @"- "]:[limText deleteCharactersInRange:NSMakeRange([limText length]-1, 1)];
                    [limText appendString: @"'"];
                    specLastChar = true;
                }
                else if([limitation isEqual: @"\""]) {
                    [limText length] < 1 ?[limText appendString: @"- "]:[limText deleteCharactersInRange:NSMakeRange([limText length]-1, 1)];
                    [limText appendString: @"\""];
                    specLastChar = true;
                }
                else {
                    [limText appendFormat:@"- %@\n", limitation];
                }
            }
        }
    }
    self.limLabel.text = limText;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)share:(id)sender
{
    NSString *subject = self.trial.acro;
    NSString *messageBody = [NSString stringWithFormat:@"<html><body><br\\>Check out this article I found using the free <a href='https://itunes.apple.com/us/app/acs-trials/id451326968?mt=8'>Stroke Trials</a> iOS app.</br></br><a href='%@'>%@</br></a>%@</body></html>", self.trial.link, self.trial.acro, self.trial.title];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:subject];
    [mc setMessageBody:messageBody isHTML:true];
    
    [self presentViewController:mc animated:YES completion:NULL];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showLink"]) {
        [[segue destinationViewController] setAcro:self.trial.acro];
        [[segue destinationViewController] setLink:self.trial.link];
        [[segue destinationViewController] setTitle:self.trial.title];
    }
}

@end