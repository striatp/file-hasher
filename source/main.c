#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include "include/crc32.h"

#define BUFFER_SIZE 4096

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("Usage: %s <file>\n", argv[0]);
        return 1;
    }

    FILE* f = fopen(argv[1], "rb");
    if (!f) {
        perror("fopen");
        return 1;
    }

    uint8_t buffer[BUFFER_SIZE];
    size_t read;
    uint32_t crc = 0xFFFFFFFF;

    while ((read = fread(buffer, 1, BUFFER_SIZE, f)) > 0) {
        crc = crc32(buffer, read, crc);
    }

    fclose(f);
    printf("0x%08X\n", crc);
    return 0;
}
