# I personally don't care if you steal this makefile. --GM

#-Wno-unused-but-set-variable $(CFLAGS_EXTRA)
CFLAGS = -fno-strict-aliasing -g `sdl-config --cflags` -Wall -Wextra \
	-Wno-unused-variable -Wno-unused-parameter \
	$(CFLAGS_EXTRA) \
	-Iinclude \
	-Ixlibinc \
	-I/usr/local/include \
	$(HEADERS_SDL) \
	$(HEADERS_ENet) \
	$(HEADERS_Lua)

HEADERS_SDL = `sdl-config --cflags`
HEADERS_ENet = `pkg-config libenet --cflags`
HEADERS_Lua = `pkg-config lua-5.1 --cflags` `pkg-config lua5.1 --cflags`

LDFLAGS = -g -I/usr/local/include $(LDFLAGS_EXTRA) 
LIBS_SDL = `sdl-config --libs`
LIBS_ENet = `pkg-config libenet --libs`
LIBS_Lua = `pkg-config lua-5.1 --libs` `pkg-config lua5.1 --libs`
# Lua is not an acronym. Get used to typing it with lower case u/a.
LIBS_zlib = -lz
LIBS_sackit = xlibinc/libsackit.a
LIBS = -Lxlibinc -lm $(LIBS_Lua) $(LIBS_SDL) $(LIBS_zlib) $(LIBS_sackit) -lGL -lGLEW $(LIBS_ENet)

BINNAME = iceball

OBJDIR = build/unix_gl

include main.make

