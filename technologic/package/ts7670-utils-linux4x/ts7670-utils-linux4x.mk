################################################################################
#
# ts7670-utils-linux4.x
#
################################################################################

TS7670_UTILS_LINUX4X_AUTORECONF = YES
TS7670_UTILS_LINUX4X_VERSION = 72fa03ac0e592141613136ea4584bfe984f11617
TS7670_UTILS_LINUX4X_SITE = $(call github,embeddedTS,ts7670-utils-linux4.x,$(TS7670_UTILS_LINUX4X_VERSION))

$(eval $(autotools-package))
