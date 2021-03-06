TEMPLATE = lib

unix:!macx:TARGET = pluginpy
win32:TARGET = PluginPy
macx:TARGET = PluginPy

CONFIG += debug_and_release

QT += core

PRECOMPILED_HEADER = Precompiled.h
CONFIG += precompile_header

INCLUDEPATH += ../../deps \
               ../lib
               #/usr/include/python3.6

SOURCES += ExportPy.cpp \
           ExportPyCatItem.cpp \
           ExportPyInputData.cpp \
           ExportPyPlugin.cpp \
           PluginLoader.cpp \
           PluginMgr.cpp \
           PluginPy.cpp \
           PluginWrapper.cpp

HEADERS += ExportPy.h \
           ExportPyCatItem.h \
           ExportPyInputData.h \
           ExportPyPlugin.h \
           PluginLoader.h \
           PluginMgr.h \
           PluginPy.h \
           PluginWrapper.h

DEFINES += PLUGINPY_LIB

if(!debug_and_release|build_pass) {
    CONFIG(debug, debug|release):DESTDIR = ../../debug/
    CONFIG(release, debug|release):DESTDIR = ../../release/
}

unix:!macx {
#python3-config
INCLUDEPATH += /usr/include/python3.6m
LIBS += -lpython3.6m -lpthread -ldl  -lutil -lm
}

win32 {
   LIBS += user32.lib \
           shell32.lib
}
