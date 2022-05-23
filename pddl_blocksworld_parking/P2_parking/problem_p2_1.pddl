(define (problem problema-2-1)
(:domain grid)
(:objects 
        x00 x01 x02 x03 x04 x05
	x10 x11 x12 x13 x14 x15
	x20 x21 x22 x23 x24 x25
	x30 x31 x32 x33 x34 x35
	x40 x41 x42 x43 x44 x45
	x50 x51 x52 x53 x54 x55
	car0
)
(:init
(place x00) (place x01) (place x02) (place x03) (place x04) (place x05) 
(place x10) (place x11) (place x12) (place x13) (place x14) (place x15)
(place x20) (place x21) (place x22) (place x23) (place x24) (place x25)
(place x30) (place x31) (place x32) (place x33) (place x34) (place x35)
(place x40) (place x41) (place x42) (place x43) (place x44) (place x45)
(place x50) (place x51) (place x52) (place x53) (place x54) (place x55)
		(available x01) (available x02) (available x03) (available x04) (available x05)
		(available x11) (available x12) (available x13) (available x14) (available x15)
(available x20) (available x21) (available x22) (available x23) (available x24) (available x25)
(available x30) (available x31) (available x32) (available x33) (available x34) (available x35)
(available x40) (available x41) (available x42) (available x43) (available x44) (available x45)
(available x50) (available x51) (available x52) (available x53) (available x54) (available x55)
(car car0)
(at car0 x10 x00)
(vertical car0)
(Vconn x00 x10) (Vconn x10 x00) 
(Vconn x10 x20) (Vconn x20 x10)
(Vconn x20 x30) (Vconn x30 x20)
(Vconn x30 x40) (Vconn x40 x30)
(Vconn x40 x50) (Vconn x50 x40)
(Vconn x01 x11) (Vconn x11 x01)
(Vconn x11 x21) (Vconn x21 x11)
(Vconn x21 x31) (Vconn x31 x21)
(Vconn x31 x41) (Vconn x41 x31)
(Vconn x41 x51) (Vconn x51 x41)
(Vconn x02 x12) (Vconn x12 x02)
(Vconn x12 x22) (Vconn x22 x12)
(Vconn x22 x32) (Vconn x32 x22)
(Vconn x32 x42) (Vconn x42 x32)
(Vconn x42 x52) (Vconn x52 x42)
(Vconn x03 x13) (Vconn x13 x03)
(Vconn x13 x23) (Vconn x23 x13)
(Vconn x23 x33) (Vconn x33 x23)
(Vconn x33 x43) (Vconn x43 x33)
(Vconn x43 x53) (Vconn x53 x43)
(Vconn x04 x14) (Vconn x14 x04)
(Vconn x14 x24) (Vconn x24 x14)
(Vconn x24 x34) (Vconn x34 x24)
(Vconn x34 x44) (Vconn x44 x34)
(Vconn x44 x54) (Vconn x54 x44)
(Vconn x05 x15) (Vconn x15 x05)
(Vconn x15 x25) (Vconn x25 x15)
(Vconn x25 x35) (Vconn x35 x25)
(Vconn x35 x45) (Vconn x45 x35)
(Vconn x45 x55) (Vconn x55 x45)
(Hconn x00 x01) (Hconn x01 x00)
(Hconn x01 x02) (Hconn x02 x01)
(Hconn x02 x03) (Hconn x03 x02)
(Hconn x03 x04) (Hconn x04 x03)
(Hconn x04 x05) (Hconn x05 x04)
(Hconn x10 x11) (Hconn x11 x10)
(Hconn x11 x12) (Hconn x12 x11)
(Hconn x12 x13) (Hconn x13 x12)
(Hconn x13 x14) (Hconn x14 x13)
(Hconn x14 x15) (Hconn x15 x14)
(Hconn x20 x21) (Hconn x21 x20)
(Hconn x21 x22) (Hconn x22 x21)
(Hconn x22 x23) (Hconn x23 x22)
(Hconn x23 x24) (Hconn x24 x23)
(Hconn x24 x25) (Hconn x25 x24)
(Hconn x30 x31) (Hconn x31 x30)
(Hconn x31 x32) (Hconn x32 x31)
(Hconn x32 x33) (Hconn x33 x32)
(Hconn x33 x34) (Hconn x34 x33)
(Hconn x34 x35) (Hconn x35 x34)
(Hconn x40 x41) (Hconn x41 x40)
(Hconn x41 x42) (Hconn x42 x41)
(Hconn x42 x43) (Hconn x43 x42)
(Hconn x43 x44) (Hconn x44 x43)
(Hconn x44 x45) (Hconn x45 x44)
(Hconn x50 x51) (Hconn x51 x50)
(Hconn x51 x52) (Hconn x52 x51)
(Hconn x52 x53) (Hconn x53 x52)
(Hconn x53 x54) (Hconn x54 x53)
(Hconn x54 x55) (Hconn x55 x54)
)
(:goal
(and
(at car0 x20 x30)
)
)
)

