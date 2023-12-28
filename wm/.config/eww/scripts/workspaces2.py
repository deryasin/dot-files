#!/usr/bin/env python3

import psutil
import argparse
import subprocess
import json
import sys
parser = argparse.ArgumentParser()
parser.add_argument('--monitor',
                    dest='monitor',
                    default="0"
                    )
parser.add_argument('--HYPRLAND_INSTANCE_SIGNATURE',
                    dest='HYPRLAND_INSTANCE_SIGNATURE',
                    default="0"
                    )
args = parser.parse_args()


import os
import socket

#HYPRLAND_INSTANCE_SIGNATURE = os.environ.get("HYPRLAND_INSTANCE_SIGNATURE")
HYPRLAND_INSTANCE_SIGNATURE = args.HYPRLAND_INSTANCE_SIGNATURE

if not HYPRLAND_INSTANCE_SIGNATURE:
    print("Die Umgebungsvariable HYPRLAND_INSTANCE_SIGNATURE ist nicht gesetzt.")
    exit(1)

socket_path = "/tmp/hypr/{}/.socket2.sock".format(HYPRLAND_INSTANCE_SIGNATURE)

def read_socket_data(socket_path, workspaces):
    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as sock:
        sock.connect(socket_path)
        while True:
            data = sock.recv(1024)  # Ändern Sie die Puffergröße nach Bedarf
            #print(data)
            if not data:
                break
            data_str = data.decode("utf-8") # Annahme, dass die Daten UTF-8-codiert sind
            action_list = []


def updateEWW(workspaces):
    icons={"default": " ", "default_zero": " ", "terminal": " ", "code": " ", "social": " ","music": " ", "documents": " ", "mail": "󰻧 ", "browser": " "}
    eww_output = {}
    print(json.dumps(eww_output))
                
class workspace:
    def __init__(self, id, monitorID = 0):
            self.id = id
            self.monitorID = monitorID
            self.clients = {}
            self.active = False
            self.refreshClients()
    def getActiveState(self):
        return(self.active)
    def setInactive(self):
        self.active = False
    def setActive(self):
        self.active = True
    def getID(self):
        return(self.id)
    def getMonitorID(self):
        return(self.monitorID)
    def getClient(self, client):
        return(self.clients)
    def getClients(self):
        return(self.clients)
    def refreshClients(self):
        for _client in getClients(workspace=self.id): 
            pid                 =   _client["pid"]
            workspace_id        =   _client["workspace_id"]
            monitorID           =   _client["monitorID"]
            title               =   _client["title"]
            fullscreen          =   _client["fullscreen"]
            try:
                if pid not in self.clients.keys():
                    del self.clients[pid]
            except:
                continue
            _client = self.clients[pid]
            _client.updateFullscreen(fullscreen)
            _client.updateTitle(title)
        return
    def addClient(self, pid, client):
        self.clients.update({pid: client})

class client:
    def __init__(self, pid, workspace, initialTitle, initialClass):
        self.pid            =   pid
        self.workspace      =   workspace
        self.fullscreen     =   False
        self.title          =   ""
        self.class_         =   ""
        self.initialTitle   =   initialTitle
        self.initialClass   =   initialClass

    def updateFullscreen(self, state):
        self.fullscreen = state
    def updateTitle(self, title):
        self.title = title
    def updateClass(self, class_):
        self.class_ = class_
    def getInitialClass(self):
        return(self.initialClass)
    def getInitialTitle(self):
        return(self.initalTitle)
    def getTitle(self):
        return(self.title)
    def getClass(self):
        return(self.class_)




if __name__ == "__main__":
    workspaces = {"1": {"icon": "COCK"}}
    print(HYPRLAND_INSTANCE_SIGNATURE) 
    socket_path = "/tmp/hypr/{}/.socket2.sock".format(HYPRLAND_INSTANCE_SIGNATURE)
    read_socket_data(socket_path, workspaces)
    sys.exit()

