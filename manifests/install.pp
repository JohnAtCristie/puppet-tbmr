#######################################################
# Install TBMR from local RMP file
# > Cristie Bare machine recovery for IBM Tivoli storage manager (TSM)
# > is a disaster recovery software for quick restore
# > to same or dissimilar hardware.
#
# http://www.cristie.com
# http://www.cristie.se
#
# Version: 0.3
# Author: John Skjönsberg <john.skjonsberg@cristie.se>
# File: tbmr/manifests/init.pp
#######################################################
class tbmr::install inherits tbmr {
        file { 'tbmr-7.1-2' :
       ensure                   => present,
           path                         => $::tbmr::file,
       source                   => $::tbmr::source
        }
        package {'tmbr':
                allow_virtual   => false,
                require         => File['tbmr-7.1-2'],
                ensure          => installed,
                provider        => $::tbmr::provider,
                source          => $::tbmr::file
        }
}
