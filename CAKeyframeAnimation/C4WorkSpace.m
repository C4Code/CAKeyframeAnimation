//
//  C4WorkSpace.m
//  CAKeyframeAnimation
//
//  Created by travis on 2013-07-22.
//

#import "C4WorkSpace.h"

@implementation C4WorkSpace {
    C4Image *v;
}

-(void)setup {
    v = [C4Image imageNamed:@"C4Table"];
    v.origin = CGPointMake(self.canvas.center.x , self.canvas.center.y);
    v.borderColor = C4RED;
    v.borderWidth = 1.0f;
    v.width = self.canvas.width / 2.0f;
    [self.canvas addImage:v];
}

-(void)touchesBegan {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation
                                      animationWithKeyPath:@"position.x"];
    animation.timingFunction = [CAMediaTimingFunction
                                functionWithName:kCAMediaTimingFunctionLinear];
    animation.duration = 0.5;
    
    int steps = 100;
    NSMutableArray *values = [NSMutableArray arrayWithCapacity:steps];
    double value = 0;
    float e = 2.71f;
    float x = v.origin.x;
    for (int t = 0; t < steps; t++) {
        value = 200 * pow(e, -0.025*t) * cos(0.08*t) - x; //418
        [values addObject:@(value)];
    }
    
    animation.values = values;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.delegate = self;
    animation.beginTime = CACurrentMediaTime() + 1.0f;
    
    [v.layer addAnimation:animation forKey:@"position.x"];
}

@end