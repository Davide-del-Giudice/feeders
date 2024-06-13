#include <stdio.h>
#include <strings.h>
#include <stdlib.h>

int
main()
{
    FILE *FdIn, *FdOut;
    unsigned int Count, GflNum;
    double Rnd;
    char Buffer[ 1000 ], Buf[9][1000];
    char *pCh, *Pwr;

    srandom( (unsigned int) 19041962 );

    FdIn  = fopen( "Loads8500.inc", "r" );
    FdOut = fopen( "GflIeee300Fault.inc", "w" );

    Count  = 0;
    GflNum = 0;

    while(  NULL != fgets( Buffer, sizeof( Buffer ) - 2,  FdIn ) )
    {
        Count += 1;

	if( 0 == Count % 3 )
	{
	    GflNum += 1;


	    sscanf( Buffer, "%s %s %s %s %s %s %s %s", 
	            Buf[0], Buf[1], Buf[2], Buf[3], Buf[4], Buf[5],
		    Buf[6], Buf[7] );

	    pCh  = rindex( Buf[1], '"' );
	    *pCh = 0;

	    Pwr  = rindex( Buf[7], '=' );

	    if( ((double) random()) / ((double) RAND_MAX) > 0.5 )
	    {
		fprintf( FdOut, "FI%d %s:ar %s:ai fdc%d gnd coi GFL VG=VNOM_LV \\\n", 
				GflNum, &(Buf[1][1]), &(Buf[1][1]), 2*GflNum-1 );
	    }
	    else
	    {
		fprintf( FdOut, "FI%d %s:br %s:bi fdc%d gnd coi GFL VG=VNOM_LV \\\n", 
				GflNum, &(Buf[1][1]), &(Buf[1][1]), 2*GflNum-1 );
	    }

	    fprintf( FdOut, "    P_REF=%s QG=0 CF=0.0002 LF=0.00008 RF=0.00003 PG=0.2 KD=100\n", &(Pwr[1]) );
	    fprintf( FdOut, "FRdc%d fdc%d fdc%d resistor r=10m\n", GflNum, 2*GflNum-1, 2*GflNum );
	    fprintf( FdOut, "FEdc%d fdc%d   gnd vsource vdc=600\n", GflNum, 2*GflNum );
	    fprintf( FdOut, "\n" );

//	    printf( "Pwr: %s\n", Buf[7] );
	}
    }

    printf( "Gfl number: %d\n", GflNum );
}
