# Class: tbmr
#
# Install TBMR from local RMP file
#
# Cristie Bare machine recovery for IBM Tivoli storage manager (TSM)
#
# is a disaster recovery software for quick restore
#
# to same or dissimilar hardware.
#
# http://www.cristie.com
#
# http://www.cristie.se
#
# Version: 0.3
#
# Author: John Skjönsberg <john.skjonsberg@cristie.se>
#
class tbmr(
        $provider                       = $::tbmr::variables::provider,
        $file                           = $::tbmr::variables::file,
        $source                         = $::tbmr::variables::source,
        ) inherits tbmr::variables {
        validate_string($provider)
        validate_string($file)
        validate_string($source)
        anchor {'tbmr::begin':} ->
        class {'::tbmr::install':}
        class {'::tbmr::license':}
        anchor {'tbmr::end':}
}
