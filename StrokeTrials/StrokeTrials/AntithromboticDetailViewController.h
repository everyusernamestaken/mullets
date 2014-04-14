//
//  AntithromboticDetailViewController.h
//  AntithromboticApp
//
//  Created by Simon on 23/12/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Antithrombotic.h"

@interface AntithromboticDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *AntithromboticImageView;
@property (weak, nonatomic) IBOutlet UILabel *lnameLabel;
@property (weak, nonatomic) IBOutlet UITextView *ingredientsTextView;

@property (nonatomic, strong) Antithrombotic *Antithrombotic;

@end
