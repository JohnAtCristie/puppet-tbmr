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
class tbmr::license{
   exec {'echo > /TBMRCFG/`licmgr --sig`.sig':
           command         => 'touch /TBMRCFG/`licmgr --sig`.sig',
           user            => root,
       onlyif          => ['test -f /TBMRCFG/disrec.ini','test -f /TBMRCFG/*.sig'],
       path            => '/usr/bin',
   }
}
