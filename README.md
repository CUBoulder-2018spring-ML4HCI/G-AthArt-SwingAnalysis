# G-AthArt-SwingAnalysis
Michael Vienneau
Dan Nguyen

## Goal
We set out to build a system that would take your golf swing (through a microbit on the hand) and tell you if your swing was good or bad. i.e, if you moved your wrists to much during the swing, or if you were moving your body too much, etc

## Approach
### Sensors Used
To approach this, we strapped a microbit to the hand of one of us, and recorded the gesture of us swinging (think a putting swing). 

### Feature Extractor Approach
Obviously, we are not professionals, so in the real world, we would have used the swing of a professional golfer. As basic golfers, we know in general the guidelines for good swings. However, one key notice with a putting swing is that it is best to keep your wrists as still as possible, and use your hips/shoulders to swing. Therefore your hands throughout the swing should move in an evenly-curved arc path with little sway forward or backwards perpendicular to the feet. 

### ML Model Structure
We trained a DTW algorithm to recognize the gesture of a swing with still wrists. This will now show how 'close' you are to still writsts though a swing, and if you are above a certain threshold throughout the swing, your swing was good.
The feature extraction we used was simply getting the accelerometer data from the microbit, and averaging the distance from the gesture over the entire swing. To improve on this, it would be great to incorporate maybe a kinect or another system that can more accuractly mesure an object traveling through space. Although the accerometers somewhat do this, they are not perfect for this.
Dynamic Time Warping was a good ML algorithm for this because golf swings have a definitive start and end, and DTW is great for gestures. Golf swings can be thought of as gestures as well and we used it to detect differences from swings with good form. 

### Future Work
There are a few features of a golf swing that are supposed to be consistent such as feet parallel, feet spread at about shoulders' width, and hips hinged forward. We could attach different sensors to each of these parts and during a swing and be able to detect which specific movement we could improve.

## Demo
https://www.youtube.com/watch?v=3Q0cbHlKf5g&feature=youtu.be
