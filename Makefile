include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = watchtools
watchtools_FILES = main.m WATCHTOOLSAppDelegate.m WATCHTOOLSRootViewController.m
watchtools_FRAMEWORKS = UIKit CoreGraphics

include $(THEOS_MAKE_PATH)/application.mk

after-install::
	install.exec "killall \"watchtools\"" || true
