//
//  HelloGLKitViewController.m
//  GLHSample
//
//  Created by Kushal on 27/12/12.
//  Copyright (c) 2012 emx. All rights reserved.
//

#import "HelloGLKitViewController.h"

@interface HelloGLKitViewController ()
{
    float _curRed;
    BOOL _increasing;
}

@property (strong, nonatomic) EAGLContext *context;

@end

@implementation HelloGLKitViewController

@synthesize context = _context;

 - (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.paused = !self.paused;
    
    NSLog(@"timeSinceFirstResume :%f", self.timeSinceFirstResume);
    NSLog(@"timeSinceLastDraw :%f", self.timeSinceLastDraw);
    NSLog(@"timeSinceLastResume :%f", self.timeSinceLastResume);
    NSLog(@"timeSinceLastUpdate :%f", self.timeSinceLastUpdate);
}


#pragma mark - LifeCycle Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    if (!self.context)
    {
        NSLog(@"failed t o create es context");
    }
    
    GLKView *view = (GLKView *) self.view;
    view.context = self.context;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - GLKView Delegate Methods.

- (void) glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    glClearColor(_curRed, 0.0, 0.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT);
}

#pragma mark - GLKViewController Delegate Methods.

- (void) update
{
    if(_increasing)
    {
        _curRed += 1.0 * self.timeSinceLastUpdate;
    }
    else
    {
        _curRed -= 1.0 * self.timeSinceLastUpdate;
    }
    
    if (_curRed >= 1.0) {
        _curRed = 1.0;
        _increasing = NO;
    }
    
    if (_curRed <= 0.0) {
        _curRed = 0.0;
        _increasing = YES;
    }
}
@end
