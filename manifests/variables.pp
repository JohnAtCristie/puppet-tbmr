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
# File: tbmr/manifests/variables.pp
class tbmr::variables{
	case $::osfamily {
                redhat:{
                        $provider                       = 'rpm'
                        case $::hardwareisa{
                                i386: {
                                        $file           = '/tmp/tbmr-7.1-2.i386.rpm'
                                        $source         = 'puppet:///modules/tbmr/tbmr-7.1-2.i386.rpm'
                                } #END 32bit
                                x86_64: {
                                        $file           = '/tmp/tbmr-7.1-2.x86_64.rpm'
                                        $source         = 'puppet:///modules/tbmr/tbmr-7.1-2.x86_64.rpm'
                                }#END X86
                        }#END HARDWAREISA
                } #END REDHAT
                default:{
                        fail('Only Redhat support at the moment')
                }
	}#END OSFAMILY
}#END CLASS
