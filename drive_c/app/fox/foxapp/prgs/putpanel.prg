PROCEDURE putpanel
PARAMETERS m.p_wind, m.centered, m.r1,m.c1,m.r2,m.c2,m.rbord_width,;
    m.cbord_width,m.fntname,m.fntsize,m.fntstyle
* Paint a chiseled panel from r1,c1 to r2,c2 with a chiseled border of 
* rbord_width pixels along the side and cbord_width pixels along the top
* and bottom.
IF PARAMETERS() <= 10
   m.fntstyle = ""
ENDIF	
IF PARAMETERS() <= 9
   m.fntsize = 8.00
ENDIF	
IF PARAMETERS() <= 8
   m.fntname = "MS Sans Serif"
ENDIF	
IF PARAMETERS() <= 7
   m.cbord_width = 0.7
ENDIF	
IF PARAMETERS() <= 6
   m.rbord_width = 0.5
ENDIF	

m.r2 = MIN(m.r2,WROWS())
m.c2 = MIN(m.c2,WCOLS())

IF ! _DOS
  DEFINE WINDOW (p_wind) ;
	FROM m.r1,m.c1 ;
	   TO m.r2,m.c2 ;
	FONT m.fntname,m.fntsize ;
	STYLE m.fntstyle ;
	NOFLOAT ;
	NOCLOSE ;
	NONE ;
	COLOR RGB(0, 0, 0, 192, 192, 192)
ELSE
  DEFINE WINDOW (p_wind) ;
	FROM m.r1,m.c1 ;
	   TO m.r2,m.c2 ;
	NOFLOAT ;
	NOCLOSE ;
	SHADOW  ;
	NOMINIMIZE ;
	DOUBLE ;
	COLOR SCHEME 5
ENDIF

IF m.centered
   MOVE WINDOW (m.p_wind) CENTER
ENDIF  

ACTIVATE WINDOW (m.p_wind)

IF ! _DOS
	* Map screen coordinates to window coordinates
	m.c2 = WCOLS()-.16
	m.r2 = WROWS()-.1

	* Dark edge along top of indented area	
	@ m.rbord_width,m.cbord_width TO m.rbord_width,m.c2-m.cbord_width ;
    	PEN 0 ;
	    COLOR RGB(128, 128, 128, 128, 128, 128)
	* Dark edge along left side of indented area	
	@ m.rbord_width,m.cbord_width TO m.r2-m.rbord_width,m.cbord_width ;
    	PEN 0 ;
		 COLOR RGB(128, 128, 128, 128, 128, 128)
	* Dark edge along bottom	
	@ m.r2,0 TO m.r2,m.c2 ;
    	PEN 0 ;
	    COLOR RGB(128, 128, 128, 128, 128, 128)
	* Dark edge along right side	
	@ 0,m.c2 TO m.r2,m.c2 ;
    	PEN 0 ;
	    COLOR RGB(128, 128, 128, 128, 128, 128)
	* Light edge along top
	@ 0,0 TO 0,m.c2 ;
    	PEN 0 ;
	    COLOR RGB(255, 255, 255, 255, 255, 255)
	* Light edge down left side	
	@ 0,0 TO m.r2,0 ;
    	PEN 0 ;
	    COLOR RGB(255, 255, 255, 255, 255, 255)
	* Light edge along bottom of indented area	
	@ m.r2-m.rbord_width,m.cbord_width TO m.r2-m.rbord_width,m.c2-m.cbord_width ;
	    PEN 0 ;
    	COLOR RGB(255, 255, 255, 255, 255, 255)
	* Light edge along right side of indented area	
	@ m.rbord_width,m.c2-m.cbord_width TO m.r2-m.rbord_width,m.c2-m.cbord_width ;
    	PEN 0 ;
	    COLOR RGB(255, 255, 255, 255, 255, 255)
ENDIF