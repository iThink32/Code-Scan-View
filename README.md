# Code-Scan-View
A simple view that animates to show that a code is being scanned.

To begin the scan set your view's class to CodeScanView in the storyboard and the border width and scan-color in the identity inspector (scan color is the color which will be used for animation) and then call it this way:-

```
self.viewCamera.beginScanAnimation()
```
and stop it by calling:-

```
self.viewCamera.stopScanAnimation()
```

where viewCamera is your code view

refer the screen shot below:

![alt text](https://github.com/iThink32/Code-Scan-View/blob/master/Screen%20Shot%202017-12-15%20at%206.25.13%20PM%201.png)
