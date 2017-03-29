//
//  ITModelChangesTypes.h
//  ITObjCUI
//
//  Created by Ivan Tsyganok on 28.03.17.
//  Copyright © 2017 Ivan Tsyganok. All rights reserved.
//

#import "ITOneIndexModel.h"
#import "ITTwoIndexModel.h"

@interface ITInsertChange : ITOneIndexModel

@end

@interface ITDeleteChange : ITOneIndexModel

@end

@interface ITMoveChange : ITTwoIndexModel

@end
