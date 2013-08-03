vc-testing-hotcode
==================

View Controllers Testing in iOS @ Hotcode Conf


1. Update project dependencies via "pod update"
2. Check EPViewCtrlTests.m
3. 
xcodebuild -sdk iphonesimulator -workspace EPViewCtrl.xcworkspace -scheme EPViewCtrlTests -configuration Debug RUN_APPLICATION_TESTS_WITH_IOS_SIM=YES ONLY_ACTIVE_ARCH=NO clean build
