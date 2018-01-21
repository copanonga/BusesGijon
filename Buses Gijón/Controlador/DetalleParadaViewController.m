//
//  DetalleParadaViewController.m
//  Buses Gijón
//
//  Created by PROIMA on 27/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import "DetalleParadaViewController.h"
#import "ViewController.h"

@interface DetalleParadaViewController () {
	NSMutableArray *listadoParadasTrayectos;
}

@end

@implementation DetalleParadaViewController

- (void)viewDidLoad {
	
	NSLog(@"\nDetalleParadaViewController");
    [super viewDidLoad];
	
	[self getDatos];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Obtener datos

-(void)getDatos {
	
	NSMutableArray *viewControllers = [NSMutableArray arrayWithArray:[[self navigationController] viewControllers]];
	
	for ( int i = 0 ; i < [viewControllers count] ; i++ ) {
		
		UIViewController *vistaAnterior = [viewControllers objectAtIndex:i];
		
		if ([vistaAnterior isKindOfClass:[ViewController class]]){
			
			ViewController *viewPrincipal = [viewControllers objectAtIndex:i];
			listadoParadasTrayectos = [[NSMutableArray alloc] init];
			listadoParadasTrayectos = [viewPrincipal getParadasTrayectos];
			
		}
	}
}

- (IBAction)botonVolver:(id)sender {

	[self.navigationController popViewControllerAnimated:YES];
	
}

@end
