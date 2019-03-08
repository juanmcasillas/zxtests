// juego.c
// Esqueleto de juegos de Radastan para amstrad CPC
// version 0.1 beta

#include <config.h>
#include <spritescpc.h>
#include <lib\motorcpc.h>

void main (void)
{
	int a;
	set_mode(0); // Pasamos al modo 0 de pantalla
	while(1)
	{
		for (a=0;a<255;a++)
		{
			cls(a);
		}
	}
}
