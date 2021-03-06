(define (problem problema-2-1)
(:domain grid)
(:objects 
        x00 x01 x02 x03 x04 x05
	x10 x11 x12 x13 x14 x15
	x20 x21 x22 x23 x24 x25
	x30 x31 x32 x33 x34 x35
	x40 x41 x42 x43 x44 x45
	x50 x51 x52 x53 x54 x55
	car0 car1 car2 car3 car4 car5 car6 car7 car8 car9 car10 car11 car12 car13 car14 car15 car16 car17
)
(:init
(place x00) (place x01) (place x02) (place x03) (place x04) (place x05) 
(place x10) (place x11) (place x12) (place x13) (place x14) (place x15)
(place x20) (place x21) (place x22) (place x23) (place x24) (place x25)
(place x30) (place x31) (place x32) (place x33) (place x34) (place x35)
(place x40) (place x41) (place x42) (place x43) (place x44) (place x45)
(place x50) (place x51) (place x52) (place x53) (place x54) (place x55)
				 		 		 		 		
				 		 		 		 		
		 		 		 		 		 		
		 		 		 		 		 		
		 		 		 		 		 		
		 		 		 				 		
(car car0)
(car car1)
(car car2)
(car car3)
(car car4)
(car car5)
(car car6)
(car car7)
(car car8)
(car car9)
(car car10)
(car car11)
(car car12)
(car car13)
(car car14)
(car car15)
(car car16)
(car car17)
(at car0 x10 x00)
(vertical car0)
(at car1 x01 x02)
(horizontal car1)
(at car2 x11 x12)
(horizontal car2)
(at car3 x21 x22)
(horizontal car3)
(at car4 x31 x32)
(horizontal car4)
(at car5 x41 x42)
(horizontal car5)
(at car6 x51 x52)
(horizontal car6)
(at car7 x03 x13)
(vertical car7)
(at car8 x23 x24)
(horizontal car8)
(at car9 x33 x34)
(horizontal car9)
(at car10 x43 x44)
(horizontal car10)
(at car11 x53 x54)
(horizontal car11)
(at car12 x20 x30)
(vertical car12)
(at car13 x25 x35)
(vertical car13)
(at car14 x45 x55)
(vertical car14)
(at car15 x04 x14)
(vertical car15)
(at car16 x50 x40)
(vertical car16)
(at car17 x05 x15)
(vertical car17)
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
(at car0 x05 x15)
)
)
)


