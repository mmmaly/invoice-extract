#!/bin/bash
#perl -n -e 'if(/(\d)(\d)(\d)(\d)(\d)(\d)(\d)(\d)/){print if (($1*8+$2*7+$3*6+$4*5+$5*4+$6*3+$7*2+$8*1)%11==0);}'
perl -n -e 'if(/(\d)(\d)(\d)(\d)(\d)(\d)(\d)(\d)/){print if ((11-($1*8+$2*7+$3*6+$4*5+$5*4+$6*3+$7*2)%11)%10==$8);}'
