//
//  LineaTableViewCell.m
//  Buses Gijón
//
//  Created by PROIMA on 27/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import "LineaTableViewCell.h"
#import "Util.h"

@implementation LineaTableViewCell
@synthesize labelCodigo, viewContenido;

- (void)awakeFromNib {
	
	[super awakeFromNib];
	
	labelCodigo.contentMode = UIViewContentModeScaleAspectFit;
	labelCodigo.layer.backgroundColor = [[UIColor redColor] CGColor];
	labelCodigo.layer.cornerRadius = labelCodigo.frame.size.width / 2;
	labelCodigo.layer.masksToBounds = YES;
	
	viewContenido.layer.cornerRadius = 8;
	viewContenido.layer.masksToBounds = YES;
	
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(int)getAltura {
	return 105;
}

-(int)getAnchura {
	return 320;
}

- (LineaTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath Linea:(Linea *) linea {
	
	static NSString *cellIdentifier = @"LineaIdentifier";
	LineaTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (!cell) {
		cell = [[LineaTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
	}
	
	cell.labelCodigo.text = linea.codigo;
	cell.labelDescripcion.text = linea.descripcion;
	[cell.labelColor setBackgroundColor:[[Util alloc] colorFromHexString:linea.colorHex]];
	
	return cell;
	
}

@end
