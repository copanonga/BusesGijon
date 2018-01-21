//
//  ParadasLineasContainerViewController.m
//  Buses Gijón
//
//  Created by PROIMA on 29/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import "ParadasLineasContainerViewController.h"
#import "ParadaTableViewCell.h"
#import "DetalleParadaViewController.h"

@interface ParadasLineasContainerViewController () {
	
	NSMutableArray *listadoParadasTrayectos;
	
}

@property (strong, nonatomic) IBOutlet UITableView *tablaResultados;

@end

@implementation ParadasLineasContainerViewController
@synthesize tablaResultados;

- (void)viewDidLoad {
	
	NSLog(@"\nParadasLineasContainerViewController");
    [super viewDidLoad];
	[self registrarCeldas];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Inicializar

-(void)setParadas:(NSMutableArray *) paradas {
	
	listadoParadasTrayectos = [[NSMutableArray alloc] init];
	listadoParadasTrayectos = paradas;
	
	[tablaResultados reloadData];
	
}

-(void)registrarCeldas {
	
	[tablaResultados registerNib:[UINib nibWithNibName:NSStringFromClass([ParadaTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"ParadaIdentifier"];
}

#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
	return [listadoParadasTrayectos count];
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return [[ParadaTableViewCell alloc] getAltura];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	Parada *parada = [listadoParadasTrayectos objectAtIndex:indexPath.row];
	return [[ParadaTableViewCell alloc] tableView:tableView cellForRowAtIndexPath:indexPath parada:parada];
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	DetalleParadaViewController *paradaBus = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"detalleParadaViewController"];
	[self.navigationController pushViewController:paradaBus animated:YES];

}

@end
