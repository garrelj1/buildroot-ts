################################################################################
#
# ts7400v2-utils-linux4.x
#
################################################################################

TS7400V2_UTILS_LINUX4X_AUTORECONF = YES
TS7400V2_UTILS_LINUX4X_VERSION = 4eb43f94663b5f519480b1033d77a4ee9e734612
TS7400V2_UTILS_LINUX4X_SITE = $(call github,embeddedTS,ts7400v2-utils-linux4.x,$(TS7400V2_UTILS_LINUX4X_VERSION))

$(eval $(autotools-package))
