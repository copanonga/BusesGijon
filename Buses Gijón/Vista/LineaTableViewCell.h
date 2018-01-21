//
//  LineaTableViewCell.h
//  Buses Gijón
//
//  Created by PROIMA on 27/12/17.
//  Copyright © 2017 Copanonga. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Linea.h"

@interface LineaTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *viewContenido;
@property (strong, nonatomic) IBOutlet UILabel *labelCodigo;
@property (strong, nonatomic) IBOutlet UILabel *labelDescripcion;
@property (strong, nonatomic) IBOutlet UILabel *labelColor;

-(int)getAltura;
-(int)getAnchura;

- (LineaTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath Linea:(Linea *) linea;

@end
