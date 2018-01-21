//
//  ParadasViewController.m
//  Buses Gijón
//
//  Created by PROIMA on 27/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import "ParadasViewController.h"
#import "ParadaTableViewCell.h"
#import "DetalleParadaViewController.h"

@interface ParadasViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tablaResultados;

@end

@implementation ParadasViewController
@synthesize listadoParadas, tablaResultados;

- (void)viewDidLoad {
	
	NSLog(@"\nParadasViewController");
    [super viewDidLoad];
	
	[self registrarCeldas];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Inicializar

-(void)registrarCeldas {
	
	[tablaResultados registerNib:[UINib nibWithNibName:NSStringFromClass([ParadaTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"ParadaIdentifier"];
}

#pragma mark - Botones

- (IBAction)botonVolver:(id)sender {

	[self.navigationController popViewControllerAnimated:YES];
	
}

#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
	return [listadoParadas count];
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return [[ParadaTableViewCell alloc] getAltura];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	Parada *parada = [listadoParadas objectAtIndex:indexPath.row];
	return [[ParadaTableViewCell alloc] tableView:tableView cellForRowAtIndexPath:indexPath parada:parada];
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];

	DetalleParadaViewController *paradaBus = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"detalleParadaViewController"];
	[self.navigationController pushViewController:paradaBus animated:YES];
	
}

@end
