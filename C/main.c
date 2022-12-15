#include <stdio.h> // printf
#include <stdint.h> // uint8_t
#include <stdlib.h> // size_t
#include <unistd.h>
#include <stdbool.h> // bool type
#include <sys/mman.h> // mmap
#include <fcntl.h> // open
#include <pthread.h> // pthreads
// The Altera SoC Abstraction Layer (SoCAL) API Reference Manual
#include "socal/socal.h"
#include "socal/hps.h" // para BASEADD


#define LEDADD 	  0x0000
#define SWADD     0x1000
#define BASEADD	  ALT_LWFPGASLVS_OFST


void * virtualbase; // puntero generico con map de userspace a hw
void * virtualbase_sw;
pthread_t thread;


void *leerSwitchs(void *ptr);


int main()
{
    size_t largobytes = 4;

    int fd; // file descriptor
    fd = open("/dev/mem", (O_RDWR|O_SYNC));

    virtualbase = mmap(NULL, largobytes,
     (PROT_READ|PROT_WRITE), MAP_SHARED, fd, BASEADD + LEDADD);
    // MAP_SHARED comparte la memoria con otras apicaciones
    // PROT READ y PROT WRITE, para lectura y escritura

    virtualbase_sw = mmap(NULL, 1, (PROT_READ | PROT_WRITE), MAP_SHARED, fd, BASEADD + SWADD);
    pthread_create(&thread, NULL, leerSwitchs, NULL);

    uint32_t count = 0;

    while(1) {
        usleep(1000*1000); // sleep forever

        alt_write_word(virtualbase, count++);
    }

    return 0;
}

void *leerSwitchs(void *ptr)
{
        uint8_t SW = 0;
        uint8_t SW_OLD = 0;

        while (1)
        {
            SW = alt_read_byte(virtualbase_sw);

            if (SW != SW_OLD)
            {
                // switchOn = true;
                printf("sw value: %d\n", SW);
            }

            SW_OLD = SW;
        }
}