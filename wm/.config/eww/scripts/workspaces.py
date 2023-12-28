#!/usr/bin/env python3

import psutil
import argparse
import subprocess
import json
import sys
import copy
parser = argparse.ArgumentParser()
parser.add_argument('--monitor',
                    dest='monitor',
                    default="0"
                    )
args = parser.parse_args()


import os
import socket

HYPRLAND_INSTANCE_SIGNATURE = os.environ.get("HYPRLAND_INSTANCE_SIGNATURE")
#HYPRLAND_INSTANCE_SIGNATURE = "v0.32.3_1703319620"
if not HYPRLAND_INSTANCE_SIGNATURE:
    print("Die Umgebungsvariable HYPRLAND_INSTANCE_SIGNATURE ist nicht gesetzt.")
    exit(1)

socket_path = "/tmp/hypr/{}/.socket2.sock".format(HYPRLAND_INSTANCE_SIGNATURE)
def read_socat_output(command, workspaces):
    try:
        with subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True) as process:
            for line in process.stdout:
                data_str = line
                action_list = []
                for action in data_str.split("\n"):
                    if action != "":
                        action_list.append(action.split(">>"))
                for action, data in action_list:
                    match action:
                        case "workspace":
                            for _workspace in workspaces.keys():
                                _workspace = workspaces[_workspace]
                                if _workspace.getID() == int(data):
                                    _workspace.setActive()
                                    _workspace.refreshClients()
                                else:
                                    _workspace.setInactive()
                
                        case "createworkspace":
                            createWorkspaces() # not optimized
                        case "destroyworkspace":
                            try:
                                del workspaces[int(data)] 
                            except:
                                continue
                    updateEWW(workspaces) 
    except subprocess.CalledProcessError as e:
        print(f"Fehler beim Verbinden oder Lesen von der Socket-Verbindung: {str(e)}")

def hypctlMonitors():
    _json = subprocess.run(["hyprctl", "monitors", "-j"], capture_output=True).stdout
    return(json.loads(_json))

def hyprctlWorkspaces():
    _json = subprocess.run(["hyprctl", "workspaces", "-j"], capture_output=True).stdout
    return(json.loads(_json))
    
def hyprctlClients():
    _json = subprocess.run(["hyprctl", "clients", "-j"], capture_output=True).stdout
    return(json.loads(_json))

def updateEww(json_):
    returnValue = subprocess.run(["eww", "update", f'workspaces={json_}'], capture_output=True).stderr
def createWorkspaces(overwrite=False):
    updatedWorkspaces  =   getWorkspaces()
    for _workspace in updatedWorkspaces:
        id          =   _workspace["id"]
        name        =   _workspace["name"]
        monitorID   =   _workspace["monitorID"]
        if overwrite:
            workspaces.update({id: workspace(id = id, monitorID = monitorID)})
        else:
            if id not in workspaces.keys():
                workspaces.update({id: workspace(id = id, monitorID = monitorID)})
            else:
                continue

def getWorkspaces():
    workspaces = []
    for _workspace in hyprctlWorkspaces():
        id          =   _workspace["id"]
        name        =   _workspace["name"]
        monitorID   =   _workspace["monitorID"]
        workspaces.append({"id": id, "name": name, "monitorID": monitorID})
    return(workspaces)


def getClients(workspace=None):
    clients = []
    for _client in hyprctlClients(): 
        address             =   _client["address"]
        pid                 =   _client["pid"]
        workspace_id        =   _client["workspace"]["id"]
        monitorID           =   _client["monitor"]
        title               =   _client["title"]
        class_              =   _client["class"]
        initialTitle        =   _client["initialTitle"]
        initialClass        =   _client["initialClass"]
        fullscreen          =   _client["fullscreen"]
        if workspace == None:
            clients.append({"address": address, "pid": pid, "workspace_id": workspace_id, "monitorID": monitorID, "title": title, "class": class_, "initialTitle": initialTitle, "initialClass": initialClass, "fullscreen": fullscreen})
        elif workspace == workspace_id:
            clients.append({"address": address, "pid": pid, "workspace_id": workspace_id, "monitorID": monitorID, "title": title, "class": class_, "initialTitle": initialTitle, "initialClass": initialClass, "fullscreen": fullscreen})
    return(clients)

def updateEWW(workspaces):
    icons={"default": " ", "default_home": " ", "terminal": " ", "code": " ", "social": " ","music": " ", "documents": " ", "mail": "󰻧 ", "browser": " "}
    for workspaceID in range(1, 10):
        eww_output[workspaceID]["classes"] = []
        if workspaceID not in workspaces:
            eww_output[workspaceID].update({"classes": "emptyWorkspace", "icon": icons["default"]})
        else:
            _workspace      =   workspaces[workspaceID]
            _workspace.refreshClients()
            active          =   _workspace.getActiveState()
            primaryClient   =   _workspace.getPrimaryClient()
            match primaryClient:
                case "org.wezfurlong.wezterm":
                    workspaceIcon  =   icons["terminal"]
                case "firefox":
                    workspaceIcon  =   icons["browser"]  
                case _:
                    workspaceIcon  =   icons["default"]
            if active:
                eww_output[workspaceID]["classes"].append("activeWorkspace")

            if workspaceID == 1 and workspaceIcon == icons["default"]:
                workspace_icon  =   icons["default_home"]  
            eww_output[workspaceID].update({"name": workspaceID, "icon": workspaceIcon})
            eww_output[workspaceID]["classes"] = " ".join(eww_output[workspaceID]["classes"])

    updateEww(json.dumps(eww_output))#why???



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
    def getPrimaryClient(self):
        return(self.primaryClient)
    def updatePrimaryClient(self):
        clientClasses = []
        for _client in self.clients:
            _client = self.clients[_client]
            if _client.getFullscreen() or len(self.clients) == 1:
                primaryClient = _client
                self.primaryClient = _client
            else:
                clientClasses.append(_client.getClass())
        if len(set(clientClasses)) == len(clientClasses) and len(clientClasses) > 1 or len(clientClasses) == 0:
            primaryClient = "None"
            self.primaryClient = "None"
        elif not len(clientClasses) == 0:
            primaryClient = max(set(clientClasses), key = clientClasses.count)
            self.primaryClient = primaryClient
    
    def refreshClients(self):
        getClientsData = getClients(workspace=self.id)
        if len(self.clients) == 0:
            for _client in getClients(workspace=self.id):
                address             =   _client["address"]
                pid                 =   _client["pid"]
                workspace_id        =   _client["workspace_id"]
                monitorID           =   _client["monitorID"]
                initialTitle        =   _client["initialTitle"]
                initialClass        =   _client["initialClass"]
                title               =   _client["title"]
                class_              =   _client["class"]
                fullscreen          =   _client["fullscreen"]
                _client             =   client(address = address, pid = pid, workspace = workspace, initialTitle = initialTitle, initialClass = initialClass)
                self.addClient(address, _client)
        else:
            for _client in getClients(workspace=self.id):  
                address             =   _client["address"]
                pid                 =   _client["pid"]
                workspace_id        =   _client["workspace_id"]
                monitorID           =   _client["monitorID"]
                title               =   _client["title"]
                class_              =   _client["class"]
                fullscreen          =   _client["fullscreen"]
                try:
                    if address not in self.clients.keys():
                        del self.clients[address]
                        continue
                except:
                    continue
                _client = self.clients[address]
                _client.updateFullscreen(fullscreen)
                _client.updateTitle(title)
                _client.updateClass(class_)
        self.updatePrimaryClient()
    def addClient(self, address, client):
        self.clients.update({address: client})

class client:
    def __init__(self, address, pid, workspace, initialTitle, initialClass):
        self.address        =   address
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
    def getAddress(self):
        return(self.address)
    def getFullscreen(self):
        return(self.fullscreen)
    def getInitialClass(self):
        return(self.initialClass)
    def getInitialTitle(self):
        return(self.initalTitle)
    def getTitle(self):
        return(self.title)
    def getClass(self):
        return(self.class_)




if __name__ == "__main__":
    workspaces = {}
    eww_output = {} 
    for workspaceID in range(1, 10):
        eww_output.update({workspaceID: {"name": workspaceID, "classes": []}})
    for _workspace in getWorkspaces():
            id          =   _workspace["id"]
            name        =   _workspace["name"]
            monitorID   =   _workspace["monitorID"]
            workspaces.update({id: workspace(id = id, monitorID = monitorID)})
    updateEWW(workspaces)
    socat_command = ["socat", "-u", f"UNIX-CONNECT:{socket_path}", "-"]
    socket_path = "/tmp/hypr/{}/.socket2.sock".format(HYPRLAND_INSTANCE_SIGNATURE)
    read_socat_output(socat_command, workspaces)
    sys.exit()

