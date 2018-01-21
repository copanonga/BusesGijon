//
//  LineasContainerViewController.m
//  Buses Gijón
//
//  Created by PROIMA on 27/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import "LineasContainerViewController.h"
#import "Linea.h"
#import "LineaTableViewCell.h"
#import "DetalleLineaViewController.h"

@interface LineasContainerViewController () {

	NSMutableArray *listadoLineas;
	
}
@property (strong, nonatomic) IBOutlet UITableView *tablaResultados;

@end

@implementation LineasContainerViewController
@synthesize tablaResultados;

- (void)viewDidLoad {
	
	NSLog(@"\nLineasContainerViewController");
	[super viewDidLoad];
	[self registrarCeldas];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)registrarCeldas {
	
	[tablaResultados registerNib:[UINib nibWithNibName:NSStringFromClass([LineaTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"LineaIdentifier"];
}

#pragma mark - Inicializar

-(void)setLineas:(NSMutableArray *) lineas {
	
	listadoLineas = [[NSMutableArray alloc] init];
	listadoLineas = lineas;

	[tablaResultados reloadData];
	
}

#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
	return [listadoLineas count];
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return [[LineaTableViewCell alloc] getAltura];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	Linea *linea = [listadoLineas objectAtIndex:indexPath.row];
	return [[LineaTableViewCell alloc] tableView:tableView cellForRowAtIndexPath:indexPath Linea:linea];
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	Linea *lineaSeleccionada = [listadoLineas objectAtIndex:indexPath.row];
	
	DetalleLineaViewController *detalleLinea = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"detalleLineaViewController"];
	detalleLinea.lineaSeleccionada = lineaSeleccionada;
	[self.navigationController pushViewController:detalleLinea animated:YES];
	
}

@end
