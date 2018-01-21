//
//  ParadaTableViewCell.m
//  Buses Gijón
//
//  Created by PROIMA on 29/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import "ParadaTableViewCell.h"

@implementation ParadaTableViewCell
@synthesize labelDestinoAnterior, labelZonaExterior, labelZonaInterior, labelDestinoSiguiente;

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(int)getAltura {
	return 100;
}

-(int)getAnchura {
	return 375;
}

- (ParadaTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath parada:(Parada *) parada {
	
	static NSString *cellIdentifier = @"ParadaIdentifier";
	ParadaTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (!cell) {
		cell = [[ParadaTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
	}
	
	cell.labelParada.text = parada.descripcion;
	
	BOOL esExtremo = NO;
	
	[cell.labelDestinoAnterior setHidden:NO];
	if (parada.orden == 0) {
		
		[cell.labelDestinoAnterior setHidden:YES];
		
		esExtremo = YES;
		
	}
	
	[cell.labelDestinoSiguiente setHidden:NO];
	if (parada.esUltimaParada == YES) {
		
		[cell.labelDestinoSiguiente setHidden:YES];
		
		esExtremo = YES;
		
	}
	
	if (esExtremo) {
		
		cell.labelZonaExterior.contentMode = UIViewContentModeScaleAspectFit;
		cell.labelZonaExterior.layer.backgroundColor = [[UIColor redColor] CGColor];
		cell.labelZonaExterior.layer.cornerRadius = 0;
		cell.labelZonaExterior.layer.masksToBounds = YES;
		
		cell.labelZonaInterior.contentMode = UIViewContentModeScaleAspectFit;
		cell.labelZonaInterior.layer.backgroundColor = [[UIColor redColor] CGColor];
		cell.labelZonaInterior.layer.cornerRadius = 0;
		cell.labelZonaInterior.layer.masksToBounds = YES;
		
	} else {
		
		cell.labelZonaExterior.contentMode = UIViewContentModeScaleAspectFit;
		cell.labelZonaExterior.layer.backgroundColor = [[UIColor redColor] CGColor];
		cell.labelZonaExterior.layer.cornerRadius = cell.labelZonaExterior.frame.size.width / 2;
		cell.labelZonaExterior.layer.masksToBounds = YES;
		
		cell.labelZonaInterior.contentMode = UIViewContentModeScaleAspectFit;
		cell.labelZonaInterior.layer.backgroundColor = [[UIColor redColor] CGColor];
		cell.labelZonaInterior.layer.cornerRadius = cell.labelZonaInterior.frame.size.width / 2;
		cell.labelZonaInterior.layer.masksToBounds = YES;
		
	}
	
	return cell;
	
}

@end
