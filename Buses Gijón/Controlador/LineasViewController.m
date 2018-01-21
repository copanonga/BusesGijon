//
//  LineasViewController.m
//  Buses Gijón
//
//  Created by PROIMA on 27/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import "LineasViewController.h"
#import "LineasContainerViewController.h"
#import "ViewController.h"

@interface LineasViewController () {
	
	LineasContainerViewController *lineasContainer;
	NSMutableArray *listadoLineas;
	
}

@property (strong, nonatomic) IBOutlet UIView *lineasContainerView;

@end

@implementation LineasViewController
@synthesize lineasContainerView;

- (void)viewDidLoad {
	
	NSLog(@"\nLineasViewController");
    [super viewDidLoad];
	
	[self getDatos];
	[lineasContainer setLineas:listadoLineas];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Botones

- (IBAction)botonVolver:(id)sender {
	
	[self.navigationController popViewControllerAnimated:YES];
	
}

#pragma mark - Container View

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	
	if ([[segue identifier] isEqualToString:@"lineasContainerViewController"]) {
		lineasContainer = (LineasContainerViewController*) segue.destinationViewController;
	}
	
}

#pragma mark - Obtener datos

-(void)getDatos {
	
	NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:[[self navigationController] viewControllers]];
	
	for ( int i = 0 ; i < [viewControllers count] ; i++ ) {
		
		UIViewController *vistaAnterior = [viewControllers objectAtIndex:i];
		
		if ([vistaAnterior isKindOfClass:[ViewController class]]){
			
			ViewController *viewPrincipal = [viewControllers objectAtIndex:i];
			listadoLineas = [[NSMutableArray alloc] init];
			listadoLineas = [viewPrincipal getLineas];
			
		}
	}
}

@end
