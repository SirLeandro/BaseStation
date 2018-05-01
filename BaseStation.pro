TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt
CONFIG += thread

LIBS += -L/usr/lib -lmysqlcppconn
LIBS += -L/usr/lib -lmysqlclient

INCLUDEPATH += /usr/local/include
INCLUDEPATH += /usr/lib

SOURCES += main.cpp \
    servertcp.cpp

HEADERS += \
    servertcp.h

QMAKE_CC = gcc
QMAKE_CFLAGS += -std=c++11
QMAKE_CFLAGS += -lpthread
QMAKE_CFLAGS += -pthread
QMAKE_CFLAGS += -lcppconn
QMAKE_CFLAGS += -lmysqlcppconn
QMAKE_CFLAGS += -lmysqlclient


QMAKE_CXX = g++
QMAKE_CXXFLAGS += -std=c++11
QMAKE_CXXFLAGS += -lpthread
QMAKE_CXXFLAGS += -pthread
QMAKE_CXXFLAGS += -lcppconn
QMAKE_CXXFLAGS += -lmysqlcppconn
QMAKE_CXXFLAGS += -lmysqlclient
