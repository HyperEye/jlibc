JAGPATH?=$(HOME)/Jaguar
CROSSPATH?=/usr/local/m68k-aout/m68k-aout
MADMAC=$(JAGPATH)/bin/mac
CC=$(CROSSPATH)/bin/gcc
AR=$(CROSSPATH)/bin/ar

export JAGPATH
export CROSSPATH

MACFLAGS=-fb -v
CFLAGS=-mc68000 -Wall -fomit-frame-pointer -O2 -msoft-float 
SRCS=crt0.s
SRCC=start.c
SRCH=main.h jagtypes.h jagdefs.h
OBJS=$(SRCC:.c=.o) $(SRCS:.s=.o)
ASUBDIRS=string stdlib ctype stdio
OSUBDIRS=doc
SUBDIRS=$(ASUBDIRS) $(OSUBDIRS)

PROJECT=jlibc
# change also in Doxyfile!!!
PROJECT_NUMBER=0.5.5

export PROJECT_NUMBER

TARFILE=$(PROJECT)-$(PROJECT_NUMBER).tar

DISTFILES=Makefile $(SRCS) $(SRCC) $(SRCH) 
DISTFILES+=ChangeLog LICENSE jaguar.inc TODO build.sh
INSTALLH=jagtypes.h jagdefs.h
INSTALLLIB=crt0.o $(PROJECT).a

TARGET=$(HOME)/tmp/jlibc

all: .depend $(PROJECT).a

$(PROJECT).a: Makefile subdirs $(OBJS)
	$(AR) rvs $(PROJECT).a start.o 
	for dir in $(ASUBDIRS); do $(AR) rvs $(PROJECT).a $$dir/*.o; done

.PHONY: subdirs $(SUBDIRS)

subdirs: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ 

%.o: %.s
	$(MADMAC) $(MACFLAGS) $<

%.o: %.c
	$(CC) $(CFLAGS) -c $<

clean:
	for dir in $(SUBDIRS); do $(MAKE) clean -C $$dir; done
	rm -f *~ $(OBJS) $(PROJECT).a .depend

.depend: $(SRCC)
	$(CC) -M $(SRCC) > .depend

dist:
	tar cfv $(TARFILE) $(DISTFILES); \
	for dir in $(SUBDIRS); do \
	  for file in `$(MAKE) -s dist-files -C $$dir`; do \
	    tar rfv $(TARFILE) "$$dir/$$file"; \
	  done; \
	done;
	gzip $(TARFILE)

list-headers:
	for file in $(INSTALLH); do \
	  echo "$$file"; \
	done; \
	for dir in $(SUBDIRS); do \
	  for file in `$(MAKE) -s install-h -C $$dir`; do \
	    echo "$$dir/$$file"; \
	  done; \
	done

list-objects:
	for file in $(INSTALLLIB); do \
	  echo "$$file"; \
	done; \
	for dir in $(SUBDIRS); do \
	  for file in `$(MAKE) -s install-lib -C $$dir`; do \
	    echo "$$dir/$$file"; \
	  done; \
	done

install:
	mkdir -p "$(TARGET)/include"; \
	mkdir -p "$(TARGET)/lib"; \
	for file in $(INSTALLH); do \
	  install -m "u+rw,go+r" "$$file" "$(TARGET)/include"; \
	done; \
	for dir in $(SUBDIRS); do \
	  for file in `$(MAKE) -s install-h -C $$dir`; do \
	    install -m "u+rw,go+r" "$$dir/$$file" "$(TARGET)/include"; \
	  done; \
	done; \
	for file in $(INSTALLLIB); do \
	  install -m "u+rw,go+r" "$$file" "$(TARGET)/lib"; \
	done; \
	for dir in $(SUBDIRS); do \
	  for file in `$(MAKE) -s install-lib -C $$dir`; do \
	    install -m "u+rw,go+r" "$$dir/$$file" "$(TARGET)/lib"; \
	  done; \
	done


-include .depend
