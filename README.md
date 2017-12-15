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
