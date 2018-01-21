//
//  DetalleHorariosViewController.m
//  Buses Gijón
//
//  Created by PROIMA on 27/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import "DetalleHorariosViewController.h"

@interface DetalleHorariosViewController ()

@end

@implementation DetalleHorariosViewController

- (void)viewDidLoad {
	
	NSLog(@"\nDetalleHorariosViewController");
    [super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Botones

- (IBAction)botonVolver:(id)sender {
	
	CATransition* transition = [CATransition animation];
	transition.duration = 0.4f;
	transition.type = kCATransitionReveal;
	transition.subtype = kCATransitionFromBottom;
	[self.navigationController.view.layer addAnimation:transition
												forKey:kCATransition];
	[self.navigationController popViewControllerAnimated:NO];
	
}

@end
