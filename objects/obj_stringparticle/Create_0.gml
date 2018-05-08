stringLength = 32;
numberOfSegments = 4;

segLength = stringLength/numberOfSegments;

LRSeg1Length = segLength*random_range(-1.2,1.2)
LRSeg2Length = (3*segLength/4)*random_range(-1.2,1.2)
LRSeg3Length = (2*segLength/4)*random_range(-1.2,1.2)
LRSeg4Length = (1*segLength/4)*random_range(-1.2,1.2)

seg1 = segLength/1.5 + (1*segLength/4) + random(random_range(segLength/4,(segLength/4)*-1));

seg2 = segLength/1.5 + (2*segLength/4) + random(random_range(segLength/4,(segLength/4)*-1));

seg3 = segLength/1.5 + (3*segLength/4) + random(random_range(segLength/4,(segLength/4)*-1));

seg4 = segLength/1.5 + segLength + random(random_range(segLength/4,(segLength/4)*-1));

lastX = x;
lastY = y;

drawColor = c_white;

count = 0;

fade = .1;