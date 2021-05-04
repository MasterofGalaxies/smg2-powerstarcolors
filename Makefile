CROSS_COMPILE ?= powerpc-eabi-

CC ?= $(CROSS_COMPILE)gcc
AS ?= $(CROSS_COMPILE)as
LD ?= $(CROSS_COMPILE)ld
KAMEK ?= Kamek

CFLAGS ?= -O2 -Wall

ADDRESS ?= 0x80002900

O_FILES = staractor.o resultsequence.o staricon.o cometstaricon.o getstarcolorandstarselecthandler.o strings.o khooks.o

SYMBOL_MAP ?= symbols.txt


all: starcolorpatch.xml

clean:
	rm -f $(O_FILES) starcolorpatch.o starcolorpatch.xml


%.o: %.s
	$(AS) -o $@ $<

%.o: %.S
	$(CC) -c -o $@ $<

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

# Kamek can't link symbols across multiple object files, so
# combine all our object files into one and pass that to Kamek.
starcolorpatch.o: $(O_FILES)
	$(LD) --relocatable -o $@ $(O_FILES)

starcolorpatch.xml: starcolorpatch.o
	$(KAMEK) -static=$(ADDRESS) -externals=$(SYMBOL_MAP) -output-riiv=$@ $<
